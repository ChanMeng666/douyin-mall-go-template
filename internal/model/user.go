package model

import (
	"gorm.io/gorm"
	"time"
)

type User struct {
	ID        int64          `gorm:"primaryKey" json:"id"`
	Username  string         `gorm:"uniqueIndex;type:varchar(50)" json:"username"`
	Password  string         `gorm:"type:varchar(255)" json:"-"`
	Email     string         `gorm:"uniqueIndex;type:varchar(100)" json:"email"`
	Phone     string         `gorm:"type:varchar(20)" json:"phone"`
	AvatarURL string         `gorm:"type:varchar(255)" json:"avatar_url"`
	Role      string         `gorm:"type:enum('user','admin');default:'user'" json:"role"`
	Status    int8           `gorm:"default:1" json:"status"`
	CreatedAt time.Time      `json:"created_at"`
	UpdatedAt time.Time      `json:"updated_at"`
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"`
}
