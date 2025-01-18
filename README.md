# Go E-commerce Template Project

A comprehensive e-commerce backend template built with Go, designed as a learning resource for Go beginners. This project demonstrates Go web development best practices using the Gin framework, MySQL database, and various modern development patterns.

## Features

- User authentication (registration/login) with JWT
- Product catalog management
- Shopping cart functionality
- Order processing
- Payment integration readiness
- Clean architecture and project structure
- Comprehensive logging and error handling
- Configuration management
- Database migrations

## Tech Stack

- [Go](https://golang.org/) - Programming language
- [Gin](https://gin-gonic.com/) - Web framework
- [MySQL](https://www.mysql.com/) - Database
- [GORM](https://gorm.io/) - ORM library
- [JWT-Go](https://github.com/golang-jwt/jwt) - JWT authentication
- [Viper](https://github.com/spf13/viper) - Configuration management
- [Zap](https://github.com/uber-go/zap) - Logging

## Project Structure

```
douyin-mall-go-template/
├── api/                  # API handlers
│   └── v1/              
├── cmd/                  # Main applications
│   └── server/          
├── configs/             # Configuration files
├── internal/            # Private application code
│   ├── dao/            # Data Access Objects
│   ├── middleware/     # HTTP middleware
│   ├── model/          # Data models
│   ├── routes/         # Route definitions
│   └── service/        # Business logic
├── pkg/                 # Public libraries
│   ├── db/             # Database utilities
│   ├── logger/         # Logging utilities
│   └── utils/          # Utility functions
└── public/             # Static files
```

## Getting Started

### Prerequisites

- Go 1.16 or higher
- MySQL 8.0 or higher
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/douyin-mall-go-template.git
cd douyin-mall-go-template
```

2. Install dependencies:
```bash
go mod download
```

3. Set up the database:
```bash
# Create database and tables using the SQL script
mysql -u root -p < docs/database/douyin_mall_go_template_structure_only.sql
```

4. Configure the application:
```bash
# Copy the example config file
cp configs/config.yaml.example configs/config.yaml
# Edit the config file with your database credentials
```

5. Run the application:
```bash
go run cmd/server/main.go
```

The server will start at `http://localhost:8080`

## API Documentation

### Authentication APIs

#### Register User
```
POST /api/v1/register
Content-Type: application/json

{
    "username": "testuser",
    "password": "password123",
    "email": "test@example.com",
    "phone": "1234567890"
}
```

#### Login
```
POST /api/v1/login
Content-Type: application/json

{
    "username": "testuser",
    "password": "password123"
}
```

More API documentation to be added as features are implemented.

## Development Guide

### Adding a New API Endpoint

1. Define the route in `internal/routes/routes.go`
2. Create handler in `api/v1/`
3. Add service logic in `internal/service/`
4. Define models in `internal/model/`
5. Implement data access in `internal/dao/`

### Project Components

- **api/**: Contains HTTP handlers that process HTTP requests and responses
- **internal/middleware/**: Custom middleware like authentication, logging, CORS
- **internal/model/**: Data models and DTOs (Data Transfer Objects)
- **internal/service/**: Business logic implementation
- **pkg/**: Reusable packages that can be imported by other projects
- **configs/**: Configuration files and management

### Database Schema

The project includes a comprehensive e-commerce database schema with tables for:

- Users and authentication
- Products and categories
- Shopping cart
- Orders and order items
- Payment records
- User addresses
- Product reviews

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to all contributors and the Go community
- Inspired by real-world e-commerce systems and Go best practices

## Contact

If you have any questions or suggestions, please feel free to open an issue.
