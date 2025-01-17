package routes

import (
	"douyin-mall-go-template/api/v1"
	"douyin-mall-go-template/internal/middleware"
	"github.com/gin-gonic/gin"
)

func RegisterRoutes(r *gin.Engine) {
	// 中间件
	r.Use(middleware.Logger())
	r.Use(middleware.Cors())

	// API v1
	v1Group := r.Group("/api/v1")
	{
		// 添加路由
		v1Group.GET("/health", v1.HealthCheck)
		// TODO: 添加更多路由
	}
}
