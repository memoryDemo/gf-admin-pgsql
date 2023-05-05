# 使用官方的Golang镜像作为编译环境
FROM golang:1.18-alpine as builder

# 设置工作目录
WORKDIR /app

# 拷贝项目文件
COPY . .

# 设置 GOPROXY 环境变量
ENV GOPROXY https://goproxy.io/


# 安装项目依赖
RUN go mod download

# 编译项目
RUN CGO_ENABLED=0 GOOS=linux go build -o main

# 使用Alpine Linux作为基础镜像，创建一个轻量级的运行环境
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 设置 GF_DEPLOY_ENV 环境变量
ENV GF_DEPLOY_ENV=config.prod.yaml

# 创建upload目录
RUN mkdir -p /app/upload
RUN mkdir -p /app/ui
RUN mkdir -p /app/template/vm

# 复制二进制文件和其他资源文件
COPY --from=builder /app/main /app/main
COPY --from=builder /app/manifest/config /app/config
COPY --from=builder /app/resource /app/resource

# 设置容器启动时运行的命令
CMD ["/app/main"]
