//package middleware
//
//import (
//	"github.com/gin-gonic/gin"
//	"net/http"
//)
//
//func Cors() gin.HandlerFunc {
//	return func(c *gin.Context) {
//		c.Header("Access-Control-Allow-Origin", "*")
//		c.Header("Access-Control-Allow-Methods", "GET,POST,PUT,PATCH,DELETE,OPTIONS")
//		c.Header("Access-Control-Allow-Headers", "Origin,Content-Type,Authorization")
//		c.Header("Access-Control-Expose-Headers", "Content-Length,Access-Control-Allow-Origin,Access-Control-Allow-Headers")
//		c.Header("Access-Control-Max-Age", "86400")
//
//		if c.Request.Method == http.MethodOptions {
//			c.AbortWithStatus(http.StatusNoContent)
//			return
//		}
//
//		c.Next()
//	}
//}

// internal/middleware/cors.go
package middleware

import (
	"github.com/gin-gonic/gin"
)

func Cors() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Header("Access-Control-Allow-Origin", "*")
		c.Header("Access-Control-Allow-Methods", "GET,POST,PUT,PATCH,DELETE,OPTIONS")
		c.Header("Access-Control-Allow-Headers", "Origin,Content-Type,Authorization")
		c.Header("Access-Control-Expose-Headers", "Content-Length,Access-Control-Allow-Origin,Access-Control-Allow-Headers")
		c.Header("Access-Control-Max-Age", "86400")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}

		c.Next()
	}
}
