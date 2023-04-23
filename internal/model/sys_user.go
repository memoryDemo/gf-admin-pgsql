package model

import (
	"github.com/memoryDemo/gf-admin-pgsql/internal/model/entity"
)

// 用户登录输入
type SysUserLoginInput struct {
	UserName string // 用户名或用户昵称
	Password string // 密码
}

// 用户登录输出
type SysUserLoginOutput struct {
	UserId   uint   // 用户ID
	UserName string // 用户名
}

// 获取用户列表输入
type SysUserListInput struct {
	UserName  string // 用户账号
	NickName  string // 用户昵称
	Status    string // 用户状态；0:正常,1:停用
	DeptId    string // 部门id
	BeginTime string // 开始时间
	EndTime   string // 结束时间
	PageNum   int    // 分页码
	PageSize  int    // 分页数量
}

// 获取用户列表输出
type SysUserListOutput struct {
	Rows  []*SysUserOneOutput // 列表
	Total int                 // 数据总数
}

// 获取单个用户信息输入
type SysUserOneInput struct {
	UserId uint // 用户ID
}

// 获取单个用户信息输出
type SysUserOneOutput struct {
	*entity.SysUser
}

// 新增用户输入
type SysUserCreateInput struct {
	UserName string // 用户账号
	NickName string // 用户昵称
	Password string // 登录密码
	Mobile   string // 手机号码
	Avatar   string // 用户头像地址
	Status   string // 用户状态；0:正常,1:停用
	DeptId   int64  // 部门id
	Remark   string // 备注
	RoleIds  []uint // 角色选中id列表
}

// 更新用户信息输入
type SysUserUpdateInput struct {
	UserId   uint   // 用户ID
	UserName string // 用户账号
	NickName string // 用户昵称
	Password string // 登录密码
	Mobile   string // 手机号码
	Avatar   string // 用户头像地址
	Status   string // 用户状态；0:正常,1:停用
	DeptId   int64  // 部门id
	Remark   string // 备注
	RoleIds  []uint // 角色选中id列表
}

// 删除用户输入
type SysUserDeleteInput struct {
	UserIdList []int // 需要删除的数据主键，例：[1,2,3]
}

// 用户密码重置输入
type SysUserResetPwdInput struct {
	UserId   uint   // 用户ID
	Password string // 登录密码
}

// 用户状态修改输入
type SysUserChangeStatusInput struct {
	UserId uint   // 用户ID
	Status string // 用户状态；0:正常,1:禁用
}

// 用户修改个人信息输入
type SysUserUpdateProfileInput struct {
	UserId   uint   // 用户ID
	NickName string // 用户昵称
	Mobile   string // 手机号码
}

// 用户修改个人密码输入
type SysUserUpdatePwdInput struct {
	UserId      uint   // 用户ID
	OldPassword string // 旧密码
	NewPassword string // 新密码
}

// 用户修改个人信息输入
type SysUserUpdateAvatarInput struct {
	UserId uint   // 用户ID
	Avatar string // 用户头像地址
}

// LoginRsp
type LoginRsp struct {
	UserID        int64    `json:"user_id"`
	UserName      string   `json:"user_name"`
	UserNickName  string   `json:"user_nick_name"`
	Token         string   `json:"token"`
	UserType      string   `json:"user_type"`
	FuncList      []string `json:"func_list"`
	PwdNeedChange bool     `json:"pwd_need_change"`
}

type ADUserInfo struct {
	BusinessPhones    []string `json:"businessPhones"`
	DisplayName       string   `json:"displayName"`
	GivenName         string   `json:"givenName"`
	JobTitle          string   `json:"jobTitle"`
	Mail              string   `json:"mail"`
	MobilePhone       string   `json:"mobilePhone"`
	OfficeLocation    string   `json:"officeLocation"`
	PreferredLanguage string   `json:"preferredLanguage"`
	Surname           string   `json:"surname"`
	UserPrincipalName string   `json:"userPrincipalName"`
	Id                string   `json:"id"`
}

type AddOrCreateUserRequest struct {
	UserId        int64   `json:"user_id"`
	UserType      string  `json:"user_type"`
	NickName      string  `json:"nick_name"`
	UserName      string  `json:"user_name"`
	Status        int     `json:"status"`
	Password      string  `json:"passwd"`
	PwdNeedChange int     `json:"pwd_need_change"`
	Phone         string  `json:"phone"`
	Email         string  `json:"email"`
	Roles         []int64 `json:"roles"`
	TenantID      int64   `json:"tenant_id"`
}
