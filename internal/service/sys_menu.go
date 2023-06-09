package service

import (
	"context"
	"errors"
	"github.com/memoryDemo/gf-admin-pgsql/internal/model"
	"github.com/memoryDemo/gf-admin-pgsql/internal/service/internal/dao"
	"time"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/util/gconv"
)

type sMenu struct{}

// 菜单管理服务
func SysMenu() *sMenu {
	return &sMenu{}
}

// 获取菜单列表
// TODO OmitEmpty支持特殊字符空值过滤，相关函数可以改写了
func (s *sMenu) GetList(ctx context.Context, in model.SysMenuListInput) (out []*model.SysMenuOneOutput, err error) {
	m := dao.SysMenu.Ctx(ctx).OmitEmpty().Where("status", in.Status)
	if in.MenuName != "" {
		m = m.Where("menu_name like ?", "%"+in.MenuName+"%")
	}
	err = m.Scan(&out)
	return
}

// 获取菜单详细信息,缓存10小时
func (s *sMenu) GetOne(ctx context.Context, in model.SysMenuOneInput) (out *model.SysMenuOneOutput, err error) {
	err = dao.SysMenu.Ctx(ctx).Cache(gdb.CacheOption{
		Duration: time.Hour * 10,
		Name:     "menuId-" + gconv.String(in.MenuId),
		Force:    false,
	}).Where("menu_id", in.MenuId).Scan(&out)
	return
}

// 新增菜单
func (s *sMenu) Create(ctx context.Context, in model.SysMenuCreateInput) (err error) {
	// 路由地址不能重复
	if in.Path != "" {
		menuCount, err := dao.SysMenu.Ctx(ctx).Where("path=?", in.Path).Count()
		if err != nil {
			return err
		}
		if menuCount > 0 {
			return errors.New("路由地址已存在！")
		}
	}
	_, err = dao.SysMenu.Ctx(ctx).Insert(in)
	return
}

// 更新菜单,并删除缓存
// TODO 有BUG删除菜单时，子菜单的缓存并不会删除
func (s *sMenu) Update(ctx context.Context, in model.SysMenuUpdateInput) (err error) {
	_, err = dao.SysMenu.Ctx(ctx).OmitEmpty().Cache(gdb.CacheOption{
		Duration: -1,
		Name:     "menuId-" + gconv.String(in.MenuId),
	}).Data(in).Where("menu_id=? AND parent_id=?", in.MenuId, in.ParentId).Update()
	return
}

// 删除菜单,并删除缓存
func (s *sMenu) Delete(ctx context.Context, in model.SysMenuDeleteInput) (err error) {
	for _, v := range in.MenuIdList {
		if _, err = dao.SysMenu.Ctx(ctx).Cache(gdb.CacheOption{
			Duration: -1,
			Name:     "menuId-" + gconv.String(v),
		}).Delete("menu_id=?", v); err != nil {
			return
		}
	}
	return
}

// 查询菜单下拉树结构
func (s *sMenu) Treeselect(ctx context.Context, menuIds []int) (treeList []map[string]interface{}, err error) {
	var menuEntitys []*model.SysMenuOneOutput
	if err = dao.SysMenu.Ctx(ctx).Where("status=0").Scan(&menuEntitys); err != nil {
		return
	}
	treeList, _ = s.formMenuTree(ctx, 0, menuEntitys)
	return
}

// 构造树形菜单列表
func (s *sMenu) formMenuTree(ctx context.Context, parentId int, entities []*model.SysMenuOneOutput) (treeRoute []map[string]interface{}, err error) {
	for _, entity := range entities {
		if entity.ParentId == parentId {
			subTree, err := s.formMenuTree(ctx, entity.MenuId, entities)
			if err != nil {
				return nil, err
			}
			children := make(map[string]interface{})
			children["id"] = entity.MenuId
			children["label"] = entity.MenuName
			if subTree != nil {
				children["children"] = subTree
			}
			treeRoute = append(treeRoute, children)
		}
	}
	return treeRoute, err
}
