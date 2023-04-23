package service

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"github.com/memoryDemo/gf-admin-pgsql/internal/consts"
	"github.com/memoryDemo/gf-admin-pgsql/internal/model"
	"github.com/memoryDemo/gf-admin-pgsql/internal/service/internal/dao"
	"io/ioutil"
	"net/http"
	"strconv"
	"time"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/util/gconv"
)

type sUser struct{}

// 用户管理服务
func SysUser() *sUser {
	return &sUser{}
}

// 登录验证
func (s *sUser) Login(ctx context.Context, in model.SysUserLoginInput) (out *model.SysUserLoginOutput, err error) {
	if err = dao.SysUser.Ctx(ctx).Where("password=? AND status=0", in.Password).Where(
		"nick_name=? or user_name=?", in.UserName, in.UserName,
	).Scan(&out); err != nil {
		return
	}
	if out == nil {
		err = gerror.New("用户名或密码错误！")
		return
	}
	return
}

// 获取用户列表
func (s *sUser) GetList(ctx context.Context, in model.SysUserListInput) (out model.SysUserListOutput, err error) {
	m := dao.SysUser.Ctx(ctx).OmitEmpty().Where(g.Map{
		"status":  in.Status,
		"dept_id": in.DeptId,
	})
	if in.UserName != "" {
		m = m.Where("user_name LIKE ?", "%"+in.UserName+"%")
	}
	if in.NickName != "" {
		m = m.Where("nick_name LIKE ?", "%"+in.NickName+"%")
	}
	if in.BeginTime != "" && in.EndTime != "" {
		m = m.Where("created_at>? and created_at<?", in.BeginTime, in.EndTime)
	}
	if err = m.Page(in.PageNum, in.PageSize).Scan(&out.Rows); err != nil {
		return
	}
	out.Total, err = m.Count()
	return
}

// 获取用户详细信息,缓存10小时
func (s *sUser) GetOne(ctx context.Context, in model.SysUserOneInput) (out *model.SysUserOneOutput, err error) {
	err = dao.SysUser.Ctx(ctx).Cache(gdb.CacheOption{
		Duration: time.Hour * 10,
		Name:     "userId-" + gconv.String(in.UserId),
		Force:    false,
	}).Where("user_id", in.UserId).Scan(&out)
	return
}

// 新增用户
func (s *sUser) Create(ctx context.Context, in model.SysUserCreateInput) (err error) {
	userCount, err := dao.SysUser.Ctx(ctx).Where("user_name=? OR nick_name=?", in.UserName, in.NickName).Count()
	if err != nil {
		return err
	}
	if userCount > 0 {
		return errors.New("账户或昵称已存在！")
	}
	lastInsertId, err := dao.SysUser.Ctx(ctx).InsertAndGetId(in)
	if err != nil {
		return err
	}
	// 添加用户和角色关联信息
	SysUserRole().UpdateUser(ctx, model.SysUserRoleUpdateUInput{UserId: uint(lastInsertId), Roleids: in.RoleIds})
	return
}

// 更新用户,并删除缓存
func (s *sUser) Update(ctx context.Context, in model.SysUserUpdateInput) (err error) {
	_, err = dao.SysUser.Ctx(ctx).OmitEmpty().Cache(gdb.CacheOption{
		Duration: -1,
		Name:     "userId-" + gconv.String(in.UserId),
	}).Data(in).Where("user_id", in.UserId).Update()
	// 更新用户和角色关联信息
	SysUserRole().UpdateUser(ctx, model.SysUserRoleUpdateUInput{UserId: in.UserId, Roleids: in.RoleIds})
	return
}

// 删除用户,并删除缓存
func (s *sUser) Delete(ctx context.Context, in model.SysUserDeleteInput) (err error) {
	// userIdList := gstr.Split(in.UserIdStr, ",")
	for _, v := range in.UserIdList {
		if _, err = dao.SysUser.Ctx(ctx).Cache(gdb.CacheOption{
			Duration: -1,
			Name:     "userId-" + string(rune(v)),
		}).Delete("user_id=?", v); err != nil {
			return
		}
	}
	// 删除用户和角色的管理信息
	if err = SysUserRole().Delete(ctx, model.SysUserRoleDeleteInput{UserIdList: in.UserIdList}); err != nil {
		return
	}
	// 删除用户token
	SysUserOnline().Delete(ctx, model.SysUserOnlineDeleteInput{IdList: gconv.Uint64s(in.UserIdList)})
	return
}

// 用户密码重置,只是修改密码，无需删除缓存
func (s *sUser) ResetPwd(ctx context.Context, in model.SysUserResetPwdInput) (err error) {
	_, err = dao.SysUser.Ctx(ctx).OmitEmpty().Data(in).Where("user_id", in.UserId).Update()
	return
}

// 用户状态修改，并删除缓存
func (s *sUser) ChangeStatus(ctx context.Context, in model.SysUserChangeStatusInput) (err error) {
	if _, err = dao.SysUser.Ctx(ctx).OmitEmpty().Cache(gdb.CacheOption{
		Duration: -1,
		Name:     "userId-" + gconv.String(in.UserId),
	}).Data(in).Where("user_id", in.UserId).Update(); err != nil {
		return
	}

	// 删除用户token
	SysUserOnline().Delete(ctx, model.SysUserOnlineDeleteInput{IdList: gconv.Uint64s(in.UserId)})
	return
}

// 用户修改个人信息
func (s *sUser) UpdateProfile(ctx context.Context, in model.SysUserUpdateProfileInput) (err error) {
	_, err = dao.SysUser.Ctx(ctx).OmitEmpty().Cache(gdb.CacheOption{
		Duration: -1,
		Name:     "userId-" + gconv.String(in.UserId),
	}).Data(in).Where("user_id", in.UserId).Update()
	return
}

// 用户修改个人密码,只是修改密码，无需删除缓存
func (s *sUser) UpdatePwd(ctx context.Context, in model.SysUserUpdatePwdInput) (err error) {
	r, err := dao.SysUser.Ctx(ctx).Where("user_id=? AND password=?", in.UserId, in.OldPassword).One()
	if err != nil {
		return err
	}
	if len(r) == 0 {
		return gerror.New("旧密码错误！")
	}
	_, err = dao.SysUser.Ctx(ctx).Data("password", in.NewPassword).Where("user_id", in.UserId).Update()
	return
}

// 用户修改头像
func (s *sUser) UpdateAvatar(ctx context.Context, in model.SysUserUpdateAvatarInput) (err error) {
	// 删除历史头像文件
	userEntity, err := s.GetOne(ctx, model.SysUserOneInput{UserId: in.UserId})
	if err != nil {
		return err
	}
	gfile.Remove(userEntity.Avatar)
	// 保存头像链接
	_, err = dao.SysUser.Ctx(ctx).OmitEmpty().Cache(gdb.CacheOption{
		Duration: -1,
		Name:     "userId-" + gconv.String(in.UserId),
	}).Data(in).Where("user_id", in.UserId).Update()
	return
}

// MSALSsoLogin MSAL单点登陆
func MSALSsoLogin(ctx context.Context, Token string) (res string, err error) {
	adUserInfo, err := GetMe(Token)
	if err != nil {
		g.Log().Error(ctx, "调用azure接口失败：%v", err)
		return
	}
	resp, err := json.Marshal(adUserInfo)
	res = string(resp)
	g.Log().Info(ctx, "获取到的azure用户信息为：%v", string(resp))
	//result := CheckUserName([]string{adUserInfo.UserPrincipalName})
	//g.Log().Info(ctx, "查到的用户大小：%v", len(result))
	//userid := 0
	//if len(result) == 0 {
	//	request := &model.AddOrCreateUserRequest{
	//		UserId:        0,
	//		UserType:      "custom",
	//		NickName:      adUserInfo.DisplayName,
	//		UserName:      adUserInfo.UserPrincipalName,
	//		Status:        0,
	//		Password:      "Connext@0101",
	//		PwdNeedChange: 0,
	//		Phone:         "",
	//		Email:         adUserInfo.UserPrincipalName,
	//		Roles:         []int64{2},
	//		TenantID:      0,
	//	}
	//	//仿造token
	//	var content = new(pcontext.CommonInfo)
	//	superToken := GetSuperToken()
	//	content.Token = superToken
	//	userid = int(usermgmtmodel.CreateOrUpdateUser(content, request, 0, "SsoLogin"))
	//} else {
	//	userid = int(result[0].UserId)
	//}
	//if userid == 0 {
	//	plog.Assert(errors.New("account user id ==0 ,error"))
	//}
	//
	//loginRsp, err := usermgmtmodel.Login(&usermgmttype.LoginRequest{
	//	Passwd:   "Connext@0101",
	//	UserName: adUserInfo.UserPrincipalName,
	//}, 0, "", false)
	//
	//loginRsp.PwdNeedChange = false
	//return loginRsp, err
	return
}

func GetMe(token string) (resp model.ADUserInfo, err error) {
	var (
		client = &http.Client{}
	)

	req, err := http.NewRequest("GET", consts.MICROSOFTGRAPH_CHINACLOUDAPI_GLOBAL, bytes.NewReader([]byte{}))
	if err != nil {
		return model.ADUserInfo{}, err
	}
	req.Header.Add("Content-Type", "application/json")
	req.Header.Add("Authorization", fmt.Sprintf("Bearer %s", token))
	res, err := client.Do(req)
	if err != nil {
		return model.ADUserInfo{}, err
	}
	body, err := ioutil.ReadAll(res.Body)
	//fmt.Println(res.StatusCode)
	//fmt.Println(string(body))
	if res.StatusCode == 200 {
		err = json.Unmarshal(body, &resp)
		if err != nil {
			return model.ADUserInfo{}, err
		}
	} else {
		err = errors.New("api return code:" + strconv.Itoa(res.StatusCode))
		return model.ADUserInfo{}, err
	}
	if err != nil {
		return model.ADUserInfo{}, err
	}

	return
}

// Check UserName
//func CheckUserName(userName []string) []*usermgmttype.AuthUsers {
//	orm, err := pdb.GetDBInstance()
//	plog.Assert(err)
//	//orm.SetDebug(true)
//	result := make([]*usermgmttype.AuthUsers, 0)
//	model := orm.Table("t_sys_auth_users")
//	model.Where(
//		"enabled", 0).Where(
//		"deleted", 0).Where("user_name", userName).Structs(&result)
//	plog.Assert(err)
//	return result
//}
