<div align="center">
 <h1>🛍️ TikTok Shop Go<br/><small>A Production-Ready Educational Template</small></h1>
 <img src="https://img.shields.io/badge/go-%2300ADD8.svg?style=for-the-badge&logo=go&logoColor=white"/>
 <img src="https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white"/>
 <img src="https://img.shields.io/badge/gin-%23008ECF.svg?style=for-the-badge&logo=gin&logoColor=white"/>
</div>

> [!IMPORTANT]
> This is a template project intended for educational purposes. While it demonstrates production-ready practices, please thoroughly review and enhance security measures before deploying to production.

[English](README.md) | [简体中文](README.zh-CN.md)


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

- [🌟 Introduction](#-introduction)
  - [✨ Key Features](#-key-features)
  - [📚 Table of Contents](#-table-of-contents)
  - [🛠️ Tech Stack](#️-tech-stack)
  - [📱 Frontend Implementation](#-frontend-implementation)
    - [Version 1: HTML/JS/CSS Implementation](#version-1-htmljscss-implementation)
      - [Structure](#structure)
      - [Key Features](#key-features)
      - [Running Version 1](#running-version-1)
    - [Version 2: React Implementation](#version-2-react-implementation)
      - [Structure](#structure-1)
      - [Key Features](#key-features-1)
      - [Running Version 2](#running-version-2)
    - [Comparison and Insights](#comparison-and-insights)
      - [Development Experience](#development-experience)
      - [Performance Considerations](#performance-considerations)
      - [Backend Integration](#backend-integration)
    - [Development Tips](#development-tips)
      - [Common Challenges](#common-challenges)
      - [Best Practices](#best-practices)
    - [Learning Path Recommendations](#learning-path-recommendations)
  - [📂 Project Structure](#-project-structure)
  - [🚀 Getting Started](#-getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [📝 API Documentation](#-api-documentation)
    - [Authentication](#authentication)
  - [📖 Development Guide](#-development-guide)
    - [Project Components](#project-components)
    - [Adding New Features](#adding-new-features)
  - [🗄️ Database Schema](#️-database-schema)
  - [🤝 Contributing](#-contributing)
  - [📄 License](#-license)
  - [🙋‍♀ Author](#-author)

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



## 📱 Frontend Implementation

This project demonstrates two different approaches to frontend implementation, showcasing the evolution from a simple HTML/JS/CSS stack to a modern React application. Both implementations are provided for educational purposes.

### Version 1: HTML/JS/CSS Implementation

The first version demonstrates fundamental web development concepts using vanilla HTML, JavaScript, and CSS.

#### Structure
```
public/
  ├── pages/           # HTML pages
  │   ├── login.html
  │   └── register.html
  ├── css/            # Styling
  │   └── style.css
  └── js/             # Client-side logic
      ├── login.js
      └── register.js
```

#### Key Features
- Pure HTML/JS/CSS implementation
- No build process required
- Direct integration with Go backend
- Simple state management
- Form validation using HTML5 attributes
- Basic error handling
- Tailwind CSS for styling

#### Running Version 1
1. No build step required
2. Start Go server:
```bash
go run cmd/server/main.go
```
3. Access http://localhost:8080

### Version 2: React Implementation

The second version upgrades to a modern React application with enhanced features and better development experience.

#### Structure
```
frontend/
  ├── src/
  │   ├── components/    # Reusable React components
  │   ├── pages/         # Page components
  │   ├── services/      # API services
  │   └── utils/         # Utility functions
  ├── package.json
  └── vite.config.js
```

#### Key Features
- Modern React with Hooks
- Vite build system
- Component-based architecture
- Centralized state management
- Enhanced routing with react-router-dom
- Advanced form handling
- Axios for API requests
- Tailwind CSS integration

#### Running Version 2
1. Install dependencies:
```bash
cd frontend
npm install
```

2. Development mode:
```bash
npm run dev    # Starts Vite dev server
go run cmd/server/main.go  # Start backend in another terminal
```

3. Production build:
```bash
npm run build
go run cmd/server/main.go
```

### Comparison and Insights

#### Development Experience
- **Version 1 (HTML/JS/CSS)**
  - Quick to start
  - No build process
  - Simple debugging
  - Suitable for learning basics
  - Limited code reusability

- **Version 2 (React)**
  - Modern development environment
  - Hot module replacement
  - Component reusability
  - Better state management
  - Enhanced developer tools

#### Performance Considerations
- **Version 1**
  - Lighter initial payload
  - No JavaScript framework overhead
  - Direct DOM manipulation

- **Version 2**
  - Optimized bundle size
  - Virtual DOM for efficient updates
  - Better caching capabilities
  - Lazy loading support

#### Backend Integration
- **Version 1**
  - Direct fetch API calls
  - Simple error handling
  - Basic CORS setup

- **Version 2**
  - Axios for requests
  - Interceptors for auth
  - Centralized API services
  - Enhanced error handling

### Development Tips

#### Common Challenges
1. **CORS Issues**
   - Ensure correct CORS middleware configuration
   - Check request headers in browser dev tools
   - Verify API endpoints

2. **Authentication Flow**
   - Store JWT token securely
   - Handle token expiration
   - Implement proper logout

3. **Form Handling**
   - Version 1: Use HTML5 validation
   - Version 2: Implement controlled components

#### Best Practices
1. **Error Handling**
```javascript
// Version 1
fetch('/api/v1/login', {
  // ... fetch config
}).catch(error => {
  document.getElementById('error').textContent = error.message;
});

// Version 2
try {
  await loginService.login(credentials);
} catch (error) {
  setError(error.response?.data?.message || 'Login failed');
}
```

2. **API Integration**
```javascript
// Version 1
const response = await fetch('/api/v1/register', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify(formData)
});

// Version 2
const authService = {
  register: async (userData) => {
    const response = await http.post('/api/v1/register', userData);
    return response.data;
  }
};
```

### Learning Path Recommendations

1. Start with Version 1 to understand:
   - Basic HTML structure
   - Form handling
   - API integration
   - Simple state management

2. Move to Version 2 to learn:
   - React components
   - Hooks and state management
   - Modern build tools
   - Advanced routing

3. Compare implementations to understand:
   - Code organization
   - State management approaches
   - API integration patterns
   - Build and deployment processes



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
├── frontend/
│   ├── src/
│   │   ├── components/    # Reusable React components
│   │   ├── pages/         # Page components
│   │   ├── services/      # API services
│   │   └── utils/         # Utility functions
│   ├── package.json
│   └── vite.config.js
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

This project is licensed under the Apache-2.0 License - see the [LICENSE](LICENSE) file for details.

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

