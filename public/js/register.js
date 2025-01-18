// File: public/js/register.js

// Helper function to show error messages
function showError(message) {
    const errorDiv = document.getElementById('error-message');
    errorDiv.textContent = message;
    errorDiv.classList.remove('hidden');
}

// Helper function to clear error messages
function clearError() {
    const errorDiv = document.getElementById('error-message');
    errorDiv.textContent = '';
    errorDiv.classList.add('hidden');
}

// Helper function to validate email format
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Add form submission handler
document.getElementById('register-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    clearError();

    const submitButton = document.getElementById('submit-button');
    submitButton.disabled = true;
    submitButton.textContent = 'Registering...';

    const formData = new FormData(e.target);

    // Get form values
    const username = formData.get('username').trim();
    const password = formData.get('password');
    const email = formData.get('email').trim();
    let phone = formData.get('phone');

    // Validate username
    if (username.length < 3 || username.length > 50) {
        showError('Username must be between 3 and 50 characters');
        submitButton.disabled = false;
        submitButton.textContent = 'Register';
        return;
    }

    // Validate password
    if (password.length < 6 || password.length > 50) {
        showError('Password must be between 6 and 50 characters');
        submitButton.disabled = false;
        submitButton.textContent = 'Register';
        return;
    }

    // Validate email
    if (!isValidEmail(email)) {
        showError('Please enter a valid email address');
        submitButton.disabled = false;
        submitButton.textContent = 'Register';
        return;
    }

    // Process phone number if provided
    if (phone) {
        // Remove any non-digit characters
        phone = phone.replace(/\D/g, '');

        // Validate phone number length
        if (phone.length !== 11) {
            showError('Phone number must be exactly 11 digits');
            submitButton.disabled = false;
            submitButton.textContent = 'Register';
            return;
        }
    }

    // Prepare data for submission
    const data = {
        username: username,
        password: password,
        email: email,
        phone: phone || '' // Use empty string if no phone provided
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

        // Show success message
        showError('Registration successful! Redirecting to login...');
        errorDiv.classList.remove('text-red-700', 'bg-red-100');
        errorDiv.classList.add('text-green-700', 'bg-green-100');

        // Redirect to login page after short delay
        setTimeout(() => {
            window.location.href = '/login';
        }, 2000);

    } catch (error) {
        showError(error.message);
        submitButton.disabled = false;
        submitButton.textContent = 'Register';
    }
});