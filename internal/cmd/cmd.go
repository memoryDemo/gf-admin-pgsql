package cmd

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"
	"github.com/memoryDemo/gf-admin-pgsql/internal/controller"
	"github.com/memoryDemo/gf-admin-pgsql/internal/service"
)

var (
	Main = gcmd.Command{
		Name:  "main",
		Usage: "main",
		Brief: "start http server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			s := g.Server()
			apiBasePath := g.Cfg().MustGet(ctx, "server.api_base_path").String()
			if apiBasePath == "" {
				g.Log().Fatal(ctx, "环境配置不能为空")
			}
			// /api
			s.Group(apiBasePath, func(group *ghttp.RouterGroup) {
				// 静态目录设置
				uploadPath := g.Cfg().MustGet(ctx, "upload.path").String()
				if uploadPath == "" {
					g.Log().Fatal(ctx, "文件上传配置路径不能为空")
				}
				s.AddStaticPath("/api/upload", uploadPath)

				group.Middleware(
					service.Middleware().Ctx,
					service.Middleware().CORS,
					service.Middleware().ResponseHandler,
				)
				// 登录和注销
				group.Bind(
					controller.Login.Login,
					controller.Login.Logout,
					controller.Login.MSALLoginSso,
				)
				// token验证，并把用户信息和角色字段列表保存到上下文中
				group.Middleware(service.Middleware().TokenAuth)
				// 登录后获取用户信息和路由
				group.Bind(
					controller.Login.GetInfo,
					controller.Login.GetRouters,
				)
				// 权限效验
				//group.Middleware(service.Middleware().Auth)
				group.Group("/system", func(group *ghttp.RouterGroup) {
					group.Bind(
						controller.SysUser,
						controller.SysRole,
						controller.SysMenu,
						controller.SysDictType,
						controller.SysDictData,
						controller.SysDept,
						controller.SysConfig,
					)
				})
				group.Group("/monitor", func(group *ghttp.RouterGroup) {
					group.Bind(
						controller.SysLoginLog,
						controller.SysOperLog,
						controller.SysUserOnline,
						controller.SysJob,
					)
				})
				group.Group("/tool", func(group *ghttp.RouterGroup) {
					group.Bind(
						controller.SysGenTable,
					)
				})
			})
			s.Run()
			return nil
		},
	}
)
