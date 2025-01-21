//// File: internal/routes/routes.go
//package routes
//
//import (
//	"douyin-mall-go-template/api/v1"
//	"douyin-mall-go-template/internal/middleware"
//	"github.com/gin-gonic/gin"
//	"net/http"
//)
//
//func RegisterRoutes(r *gin.Engine) {
//	// Serve static files
//	r.Static("/public", "./public")
//	r.LoadHTMLGlob("public/pages/*.html") // Changed from *.jsx to *.html
//
//	// Frontend routes
//	r.GET("/", func(c *gin.Context) {
//		c.Redirect(http.StatusMovedPermanently, "/login")
//	})
//
//	r.GET("/login", func(c *gin.Context) {
//		c.HTML(http.StatusOK, "login.html", nil) // Changed from Login.jsx
//	})
//
//	r.GET("/register", func(c *gin.Context) {
//		c.HTML(http.StatusOK, "register.html", nil) // Changed from Register.jsx
//	})
//
//	// API routes
//	v1Group := r.Group("/api/v1")
//	{
//		v1Group.GET("/health", v1.HealthCheck)
//
//		userHandler := v1.NewUserHandler()
//		v1Group.POST("/register", userHandler.Register)
//		v1Group.POST("/login", userHandler.Login)
//
//		auth := v1Group.Group("")
//		auth.Use(middleware.Auth())
//		{
//			// Protected routes here
//		}
//	}
//}

// internal/routes/routes.go
package routes

import (
	"douyin-mall-go-template/api/v1"
	"douyin-mall-go-template/internal/middleware"
	"github.com/gin-gonic/gin"
)

func RegisterRoutes(r *gin.Engine) {
	// CORS中间件
	r.Use(middleware.Cors())

	// 服务前端构建文件
	r.Static("/assets", "./frontend/dist/assets")
	r.StaticFile("/", "./frontend/dist/index.html")
	// 处理所有前端路由
	r.NoRoute(func(c *gin.Context) {
		c.File("./frontend/dist/index.html")
	})

	// API routes
	v1Group := r.Group("/api/v1")
	{
		v1Group.GET("/health", v1.HealthCheck)

		userHandler := v1.NewUserHandler()
		v1Group.POST("/register", userHandler.Register)
		v1Group.POST("/login", userHandler.Login)

		// 暂时注释掉未使用的认证路由组
		// auth := v1Group.Use(middleware.Auth())
		// {
		//     // 受保护的路由
		// }
	}
}
