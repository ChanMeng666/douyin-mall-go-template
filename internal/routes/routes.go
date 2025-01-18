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
		// Health check
		v1Group.GET("/health", v1.HealthCheck)

		// User routes
		userHandler := v1.NewUserHandler()
		v1Group.POST("/register", userHandler.Register)
		v1Group.POST("/login", userHandler.Login)

		// Protected routes
		auth := v1Group.Group("")
		auth.Use(middleware.Auth())
		{
			// Add protected routes here later
		}
	}
}
