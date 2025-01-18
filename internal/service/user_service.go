package service

import (
	"douyin-mall-go-template/internal/model"
	"douyin-mall-go-template/internal/model/dto"
	"douyin-mall-go-template/pkg/db"
	"douyin-mall-go-template/pkg/utils"
	"errors"
	"golang.org/x/crypto/bcrypt"
)

type UserService struct{}

func NewUserService() *UserService {
	return &UserService{}
}

func (s *UserService) Register(req *dto.RegisterRequest) error {
	// Check if username exists
	var count int64
	if err := db.DB.Model(&model.User{}).Where("username = ?", req.Username).Count(&count).Error; err != nil {
		return err
	}
	if count > 0 {
		return errors.New("username already exists")
	}

	// Hash password
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(req.Password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}

	// Create user
	user := &model.User{
		Username: req.Username,
		Password: string(hashedPassword),
		Email:    req.Email,
		Phone:    req.Phone,
		Role:     "user",
		Status:   1,
	}

	return db.DB.Create(user).Error
}

func (s *UserService) Login(req *dto.LoginRequest) (*dto.LoginResponse, error) {
	var user model.User
	if err := db.DB.Where("username = ?", req.Username).First(&user).Error; err != nil {
		return nil, errors.New("invalid username or password")
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(req.Password)); err != nil {
		return nil, errors.New("invalid username or password")
	}

	token, err := utils.GenerateToken(user.ID, user.Username, user.Role)
	if err != nil {
		return nil, err
	}

	return &dto.LoginResponse{
		Token: token,
		User: dto.User{
			ID:        user.ID,
			Username:  user.Username,
			Email:     user.Email,
			Phone:     user.Phone,
			AvatarURL: user.AvatarURL,
			Role:      user.Role,
		},
	}, nil
}
