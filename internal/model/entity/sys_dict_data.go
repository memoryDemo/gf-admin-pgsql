// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// SysDictData is the golang structure for table sys_dict_data.
type SysDictData struct {
	DictCode  int64       `json:"dictCode"  ` // 字典编码
	DictSort  int         `json:"dictSort"  ` // 字典排序
	DictLabel string      `json:"dictLabel" ` // 字典标签
	DictValue string      `json:"dictValue" ` // 字典键值
	DictType  string      `json:"dictType"  ` // 字典类型
	CssClass  string      `json:"cssClass"  ` // 样式属性（其他样式扩展）
	ListClass string      `json:"listClass" ` // 表格回显样式
	IsDefault string      `json:"isDefault" ` // 是否默认（0是 1否）
	Status    int         `json:"status"    ` // 状态（0正常 1停用）
	Remark    string      `json:"remark"    ` // 备注
	CreatedAt *gtime.Time `json:"createdAt" ` // 创建日期
	UpdatedAt *gtime.Time `json:"updatedAt" ` // 修改日期
	DeletedAt *gtime.Time `json:"deletedAt" ` // 删除日期
}
