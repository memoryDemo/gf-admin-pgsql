// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// SysUserOnline is the golang structure for table sys_user_online.
type SysUserOnline struct {
	Id            int         `json:"id"            ` // 用户ID
	Token         string      `json:"token"         ` // 用户token
	UserId        int64       `json:"userId"        ` // 用户id
	UserName      string      `json:"userName"      ` // 用户名
	Os            string      `json:"os"            ` // 操作系统
	Ipaddr        string      `json:"ipaddr"        ` // 登录IP地址
	LoginLocation string      `json:"loginLocation" ` // 登录地点
	Browser       string      `json:"browser"       ` // 浏览器类型
	CreatedAt     *gtime.Time `json:"createdAt"     ` // 登录时间
}
