ROOT_DIR    = $(shell pwd)   #定义项目的根目录
NAMESPACE   = "default"	#设置Kubernetes命名空间
DEPLOY_NAME = "template-single" #设置Kubernetes命名空间
DOCKER_NAME = "template-single" #设置Docker镜像名称

# 下载并安装最新版的GoFrame CLI工具
.PHONY: cli
cli:
	@set -e; \
	wget -O gf https://github.com/gogf/gf/releases/latest/download/gf_$(shell go env GOOS)_$(shell go env GOARCH) && \
	chmod +x gf && \
	./gf install -y && \
	rm ./gf


# 下载并安装最新版的GoFrame CLI工具
.PHONY: cli.install
cli.install:
	@set -e; \
	gf -v > /dev/null 2>&1 || if [[ "$?" -ne "0" ]]; then \
  		echo "GoFame CLI is not installed, start proceeding auto installation..."; \
		make cli; \
	fi;


# 生成DAO（数据访问对象）、DO（数据对象）和实体文件。
.PHONY: dao
dao: cli.install
	@gf gen dao



# 构建Docker镜像，将镜像和YAML部署到当前kubectl环境，并将端口转发到本地计算机。
.PHONY: start
start:
	@set -e; \
	make image; \
	make deploy; \
	make port;

# 构建Docker镜像。如果没有指定TAG，则使用Git日志中的最后一次提交的信息作为标签。
.PHONY: image
image: cli.install
	$(eval _TAG  = $(shell git log -1 --format="%cd.%h" --date=format:"%Y%m%d%H%M%S"))
ifneq (, $(shell git status --porcelain 2>/dev/null))
	$(eval _TAG  = $(_TAG).dirty)
endif
	$(eval _TAG  = $(if ${TAG},  ${TAG}, $(_TAG)))
	$(eval _PUSH = $(if ${PUSH}, ${PUSH}, ))
	@gf docker -p -b "-a amd64 -s linux -p temp" -t $(DOCKER_NAME):${_TAG};


# 构建Docker镜像并自动将其推送到Docker仓库。
.PHONY: image.push
image.push:
	@make image PUSH=-p;


# 将镜像和YAML部署到当前kubectl环境。
# 首先，它会根据指定的环境（默认为develop）创建一个Kustomize文件，然后使用kubectl将其应用到Kubernetes集群。
#最后，它会更新部署的元数据，以便Kubernetes可以识别新的部署。
.PHONY: deploy
deploy:
	$(eval _ENV = $(if ${ENV},  ${ENV}, develop))

	@set -e; \
	mkdir -p $(ROOT_DIR)/temp/kustomize;\
	cd $(ROOT_DIR)/manifest/deploy/kustomize/overlays/${_ENV};\
	kustomize build > $(ROOT_DIR)/temp/kustomize.yaml;\
	kubectl   apply -f $(ROOT_DIR)/temp/kustomize.yaml; \
	kubectl   patch -n $(NAMESPACE) deployment/$(DEPLOY_NAME) -p "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"$(shell date +%s)\"}}}}}";


