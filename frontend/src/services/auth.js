// frontend/src/services/auth.js
import http from '../utils/http';

export const login = async (credentials) => {
    const response = await http.post('/api/v1/login', credentials);
    return response.data;
};

export const register = async (userData) => {
    const response = await http.post('/api/v1/register', userData);
    return response.data;
};