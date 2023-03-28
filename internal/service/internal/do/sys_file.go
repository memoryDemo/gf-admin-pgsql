// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// SysFile is the golang structure of table sys_file for DAO operations like Where/Data.
type SysFile struct {
	g.Meta    `orm:"table:sys_file, do:true"`
	Id        interface{} // 自增ID
	Name      interface{} // 文件名称
	Src       interface{} // 本地文件存储路径
	Url       interface{} // URL地址，可能为空
	FileType  interface{} // 文件类型
	UserId    interface{} // 操作用户
	CreatedAt *gtime.Time // 创建时间
}
