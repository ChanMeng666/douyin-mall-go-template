// File: public/js/login.js
document.getElementById('login-form').addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = new FormData(e.target);
    const data = {
        username: formData.get('username'),
        password: formData.get('password')
    };

    try {
        const response = await fetch('/api/v1/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        const result = await response.json();

        if (!response.ok) {
            throw new Error(result.error || 'Login failed');
        }

        // Store token and redirect
        localStorage.setItem('token', result.token);
        window.location.href = '/dashboard';  // Redirect to dashboard page
    } catch (error) {
        const errorDiv = document.getElementById('error-message');
        errorDiv.textContent = error.message;
        errorDiv.classList.remove('hidden');
    }
});

// File: public/js/register.js
document.getElementById('register-form').addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = new FormData(e.target);
    const data = {
        username: formData.get('username'),
        password: formData.get('password'),
        email: formData.get('email'),
        phone: formData.get('phone')
    };

    try {
        const response = await fetch('/api/v1/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        const result = await response.json();

        if (!response.ok) {
            throw new Error(result.error || 'Registration failed');
        }

        // Redirect to login page on success
        window.location.href = '/login';
    } catch (error) {
        const errorDiv = document.getElementById('error-message');
        errorDiv.textContent = error.message;
        errorDiv.classList.remove('hidden');
    }
});