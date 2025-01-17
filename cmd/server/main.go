package main

import (
	"douyin-mall-go-template/internal/routes"
	"douyin-mall-go-template/pkg/db"
	"douyin-mall-go-template/pkg/logger"
	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
	"log"
)

func main() {
	// 初始化配置
	if err := initConfig(); err != nil {
		log.Fatalf("init config failed: %v", err)
	}

	// 初始化日志
	if err := logger.Init(); err != nil {
		log.Fatalf("init logger failed: %v", err)
	}

	// 初始化数据库连接
	if err := db.Init(); err != nil {
		log.Fatalf("init database failed: %v", err)
	}

	// 创建gin引擎
	r := gin.Default()

	// 注册路由
	routes.RegisterRoutes(r)

	// 启动服务器
	port := viper.GetString("server.port")
	if err := r.Run(":" + port); err != nil {
		log.Fatalf("start server failed: %v", err)
	}
}

func initConfig() error {
	viper.SetConfigName("config")
	viper.SetConfigType("yaml")
	viper.AddConfigPath("./configs")
	return viper.ReadInConfig()
}
