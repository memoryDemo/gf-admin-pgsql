package main

import (
	"gf-admin-pgsql/internal/cmd"
	_ "gf-admin-pgsql/internal/packed"
	_ "github.com/gogf/gf/contrib/drivers/pgsql/v2"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gcfg"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/gogf/gf/v2/os/genv"
)

func main() {
	// 获取环境变量GF_DEPLOY_ENV的值，如果未设置，则使用默认值"development"
	env := genv.Get("GF_DEPLOY_ENV", "config.dev.yaml")
	//g.Cfg().GetAdapter().(*gcfg.AdapterFile).SetFileName("manifest/config/" + env.String())
	g.Cfg().GetAdapter().(*gcfg.AdapterFile).SetFileName(env.String())

	cmd.Main.Run(gctx.New())
}
