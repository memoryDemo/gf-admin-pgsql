// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// SysFile is the golang structure for table sys_file.
type SysFile struct {
	Id        int64       `json:"id"        ` // 自增ID
	Name      string      `json:"name"      ` // 文件名称
	Src       string      `json:"src"       ` // 本地文件存储路径
	Url       string      `json:"url"       ` // URL地址，可能为空
	FileType  string      `json:"fileType"  ` // 文件类型
	UserId    int         `json:"userId"    ` // 操作用户
	CreatedAt *gtime.Time `json:"createdAt" ` // 创建时间
}
