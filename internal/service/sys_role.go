package service

import (
	"context"
	"errors"
	"github.com/memoryDemo/gf-admin-pgsql/internal/model"
	"github.com/memoryDemo/gf-admin-pgsql/internal/service/internal/dao"
	"time"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
)

type sRole struct{}

// 角色管理服务
func SysRole() *sRole {
	return &sRole{}
}

// 获取角色列表
func (s *sRole) GetList(ctx context.Context, in model.SysRoleListInput) (out model.SysRoleListOutput, err error) {
	m := dao.SysRole.Ctx(ctx).OmitEmpty().Where(g.Map{
		"role_name": in.RoleName,
		"status":    in.Status,
	})
	if in.BeginTime != "" && in.EndTime != "" {
		m = m.Where("created_at>? and created_at<?", in.BeginTime, in.EndTime)
	}
	if err = m.Page(in.PageNum, in.PageSize).OrderAsc("role_sort").Scan(&out.Rows); err != nil {
		return
	}
	out.Total, err = m.Count()
	return
}

// 获取角色详细信息,缓存10小时
func (s *sRole) GetOne(ctx context.Context, in model.SysRoleOneInput) (out *model.SysRoleOneOutput, err error) {
	err = dao.SysRole.Ctx(ctx).Cache(gdb.CacheOption{
		Duration: time.Hour * 10,
		Name:     "roleId-" + gconv.String(in.RoleId),
		Force:    false,
	}).Where("role_id", in.RoleId).Scan(&out)
	return
}

// 新增角色
func (s *sRole) Create(ctx context.Context, in model.SysRoleCreateInput) (err error) {
	roleCount, err := dao.SysRole.Ctx(ctx).Where("role_name=?", in.RoleName).Count()
	if err != nil {
		return err
	}
	if roleCount > 0 {
		return errors.New("角色名称或权限字符已存在！")
	}
	lastInsertId, err := dao.SysRole.Ctx(ctx).InsertAndGetId(in)
	if err != nil {
		return err
	}
	// 添加角色和菜单关联信息
	SysRoleMenu().UpdateMenu(ctx, model.SysRoleMenuUpdateRInput{RoleId: int(lastInsertId), MenuIds: in.MenuIds})
	return
}

// 更新角色,并删除缓存
func (s *sRole) Update(ctx context.Context, in model.SysRoleUpdateInput) (err error) {
	if _, err = dao.SysRole.Ctx(ctx).OmitEmpty().Cache(gdb.CacheOption{
		Duration: -1,
		Name:     "roleId-" + gconv.String(in.RoleId),
	}).Data(in).Where("role_id", in.RoleId).Update(); err != nil {
		return err
	}
	// 添加角色和菜单关联信息
	SysRoleMenu().UpdateMenu(ctx, model.SysRoleMenuUpdateRInput{RoleId: int(in.RoleId), MenuIds: in.MenuIds})
	return
}

// 删除角色,并删除缓存
func (s *sRole) Delete(ctx context.Context, in model.SysRoleDeleteInput) (err error) {
	// roleIdList := gstr.Split(in.RoleIdStr, ",")
	for _, v := range in.RoleIdList {
		if _, err = dao.SysRole.Ctx(ctx).Cache(gdb.CacheOption{
			Duration: -1,
			Name:     "roleId-" + string(rune(v)),
		}).Delete("role_id=?", v); err != nil {
			return
		}
		// 添加角色和菜单关联信息
		if err = SysRoleMenu().UpdateMenu(ctx, model.SysRoleMenuUpdateRInput{RoleId: gconv.Int(v)}); err != nil {
			return err
		}
	}
	// 删除用户和角色关联
	err = SysUserRole().Delete(ctx, model.SysUserRoleDeleteInput{RoleIdList: in.RoleIdList})
	return
}
