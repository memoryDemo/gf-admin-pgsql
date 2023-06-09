// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// ToolsGenTableDao is the data access object for table tools_gen_table.
type ToolsGenTableDao struct {
	table   string               // table is the underlying table name of the DAO.
	group   string               // group is the database configuration group name of current DAO.
	columns ToolsGenTableColumns // columns contains all the column names of Table for convenient usage.
}

// ToolsGenTableColumns defines and stores column names for table tools_gen_table.
type ToolsGenTableColumns struct {
	TableId        string // 编号
	TableName      string // 表名称
	TableComment   string // 表描述
	TplCategory    string // 使用的模板（crud单表操作 tree树表操作）
	ObjectName     string // 数据对象名称
	ApiFile        string // api文件夹
	ControllerFile string // controller文件夹
	ServerFile     string // server文件夹
	FunctionName   string // 生成功能描述
	FunctionAuthor string // 生成功能作者
	Options        string // 其它生成选项
	Remark         string // 备注
	CreatedAt      string // 创建时间
	UpdatedAt      string // 更新时间
	DeletedAt      string // 删除时间
}

// toolsGenTableColumns holds the columns for table tools_gen_table.
var toolsGenTableColumns = ToolsGenTableColumns{
	TableId:        "table_id",
	TableName:      "table_name",
	TableComment:   "table_comment",
	TplCategory:    "tpl_category",
	ObjectName:     "object_name",
	ApiFile:        "api_file",
	ControllerFile: "controller_file",
	ServerFile:     "server_file",
	FunctionName:   "function_name",
	FunctionAuthor: "function_author",
	Options:        "options",
	Remark:         "remark",
	CreatedAt:      "created_at",
	UpdatedAt:      "updated_at",
	DeletedAt:      "deleted_at",
}

// NewToolsGenTableDao creates and returns a new DAO object for table data access.
func NewToolsGenTableDao() *ToolsGenTableDao {
	return &ToolsGenTableDao{
		group:   "default",
		table:   "tools_gen_table",
		columns: toolsGenTableColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *ToolsGenTableDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *ToolsGenTableDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *ToolsGenTableDao) Columns() ToolsGenTableColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *ToolsGenTableDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *ToolsGenTableDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *ToolsGenTableDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
