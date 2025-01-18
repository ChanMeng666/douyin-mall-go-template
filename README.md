<div align="center">
 <h1>🛍️ Go E-commerce Project Template<br/><small>A Production-Ready Educational Template</small></h1>
 <img src="https://img.shields.io/badge/go-%2300ADD8.svg?style=for-the-badge&logo=go&logoColor=white"/>
 <img src="https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white"/>
 <img src="https://img.shields.io/badge/gin-%23008ECF.svg?style=for-the-badge&logo=gin&logoColor=white"/>
</div>

> [!IMPORTANT]
> This is a template project intended for educational purposes. While it demonstrates production-ready practices, please thoroughly review and enhance security measures before deploying to production.

# 🌟 Introduction

A comprehensive production-ready e-commerce backend template built with Go, designed specifically as a learning resource for Go beginners. This project demonstrates industry-standard practices in Go web development using modern tools and frameworks.

## ✨ Key Features

- 🔐 **Authentication System** - JWT-based user registration and login
- 📦 **Product Management** - Complete product catalog system
- 🛒 **Shopping Cart** - Robust shopping cart functionality
- 📋 **Order Processing** - Order management and tracking
- 💳 **Payment Integration** - Ready for payment gateway integration
- 🏗️ **Clean Architecture** - Industry-standard project structure
- 📝 **Detailed Logging** - Comprehensive logging system
- ⚙️ **Easy Configuration** - YAML-based configuration management
- 🔄 **Database Migrations** - Structured database schema management

> [!NOTE]
> - Go >= 1.16 required
> - MySQL >= 8.0 required
> - Redis >= 6.0 recommended for session management

## 📚 Table of Contents

- [Features Overview](#features-overview)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Configuration](#configuration)
- [API Documentation](#api-documentation)
- [Development Guide](#development-guide)
- [Database Schema](#database-schema)
- [Contributing](#contributing)
- [License](#license)

## 🛠️ Tech Stack

<div align="center">
  <table>
    <tr>
      <td align="center" width="96">
        <img src="https://cdn.simpleicons.org/go" width="48" height="48" alt="Go" />
        <br>Go
      </td>
      <td align="center" width="96">
        <img src="https://cdn.simpleicons.org/mysql" width="48" height="48" alt="MySQL" />
        <br>MySQL
      </td>
      <td align="center" width="96">
        <img src="https://cdn.simpleicons.org/redis" width="48" height="48" alt="Redis" />
        <br>Redis
      </td>
      <td align="center" width="96">
        <img src="https://cdn.simpleicons.org/jsonwebtokens" width="48" height="48" alt="JWT" />
        <br>JWT
      </td>
      <td align="center" width="96">
        <img src="https://cdn.simpleicons.org/go/00ADD8" width="48" height="48" alt="Gin" />
        <br>Gin
      </td>
      <td align="center" width="96">
        <img src="https://cdn.simpleicons.org/go/00ADD8" width="48" height="48" alt="GORM" />
        <br>GORM
      </td>
      <td align="center" width="96">
        <img src="https://cdn.simpleicons.org/uber" width="48" height="48" alt="Zap" />
        <br>Zap
      </td>
    </tr>
  </table>
</div>

> [!TIP]
> Each component in our tech stack was chosen for its reliability and widespread adoption in production environments. See our [docs](docs/) for detailed information about each technology.

## 📂 Project Structure

```
douyin-mall-go-template/
├── api/                  # API layer
│   └── v1/              # API version 1 handlers
├── cmd/                  # Application entry points
│   └── server/          # Main server application
├── configs/             # Configuration files
├── internal/            # Internal packages
│   ├── dao/            # Data Access Objects
│   ├── middleware/     # HTTP middlewares
│   ├── model/          # Data models and DTOs
│   ├── routes/         # Route definitions
│   └── service/        # Business logic layer
├── pkg/                 # Reusable packages
│   ├── db/             # Database utilities
│   ├── logger/         # Logging utilities
│   └── utils/          # Common utilities
└── public/             # Static assets
```

## 🚀 Getting Started

### Prerequisites

> [!IMPORTANT]
> Before you begin, ensure you have the following installed:
> - Go 1.16 or higher
> - MySQL 8.0 or higher
> - Git
> - Make (optional, for using Makefile commands)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ChanMeng666/douyin-mall-go-template.git
cd douyin-mall-go-template
```

2. Install dependencies:
```bash
go mod download
or
go mod tidy
```

3. Set up database:
```bash
mysql -u root -p < docs/database/douyin_mall_go_template_structure_only.sql
```

4. Configure application:
```bash
cp configs/config.yaml.example configs/config.yaml
# Edit configs/config.yaml with your database credentials
```

5. Start the server:
```bash
go run cmd/server/main.go
```

## 📝 API Documentation

### Authentication

<details>
<summary>User Registration</summary>

```http
POST /api/v1/register
Content-Type: application/json

{
    "username": "testuser",
    "password": "password123",
    "email": "test@example.com",
    "phone": "1234567890"
}

Response 200:
{
    "message": "registration successful"
}
```
</details>

<details>
<summary>User Login</summary>

```http
POST /api/v1/login
Content-Type: application/json

{
    "username": "testuser",
    "password": "password123"
}

Response 200:
{
    "token": "eyJhbGci...",
    "user": {
        "id": 1,
        "username": "testuser",
        "email": "test@example.com"
    }
}
```
</details>

## 📖 Development Guide

### Project Components

> [!NOTE]
> Each component is designed to be modular and follows the SOLID principles:

- **api/v1/**: HTTP request handlers
  - `health.go`: Health check endpoint
  - `user.go`: User-related endpoints

- **internal/middleware/**: Custom middleware
  - `auth.go`: JWT authentication
  - `cors.go`: CORS handling
  - `logger.go`: Request logging

- **internal/model/**: Data models
  - `user.go`: User entity
  - `dto/`: Data Transfer Objects

- **internal/service/**: Business logic
  - `user_service.go`: User-related operations

### Adding New Features

> [!TIP]
> Follow these steps to add new features to the project:

1. Define routes in `internal/routes/routes.go`
2. Create handler in `api/v1/`
3. Implement service logic in `internal/service/`
4. Define models in `internal/model/`
5. Add data access in `internal/dao/`

## 🗄️ Database Schema

Our comprehensive e-commerce database includes:

- `users`: User accounts and authentication
- `products`: Product catalog management
- `categories`: Product categorization
- `orders`: Order processing
- `order_items`: Order details
- `shopping_cart_items`: Shopping cart management
- `payment_records`: Payment tracking
- `product_reviews`: User reviews and ratings

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

好的,我会帮你美化这段markdown代码,添加LinkedIn和GitHub的图标。我会使用SVG格式的图标。



## 🙋‍♀ Author
**Chan Meng**
- <img src="https://cdn.simpleicons.org/linkedin/0A66C2" width="16" height="16"> LinkedIn: [chanmeng666](https://www.linkedin.com/in/chanmeng666/)
- <img src="https://cdn.simpleicons.org/github/181717" width="16" height="16"> GitHub: [ChanMeng666](https://github.com/ChanMeng666)

---

<div align="center">
Made with ❤️ for Go learners
<br/>
⭐ Star us on GitHub | 📖 Read the Wiki | 🐛 Report an Issue
</div>

