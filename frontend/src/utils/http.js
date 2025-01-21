// frontend/src/utils/http.js
import axios from 'axios';

const http = axios.create({
    // 使用相对路径，这样会自动使用当前域名和端口
    baseURL: '/api/v1',
    headers: {
        'Content-Type': 'application/json',
    },
});

// 添加请求拦截器
http.interceptors.request.use(
    (config) => {
        const token = localStorage.getItem('token');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    (error) => {
        return Promise.reject(error);
    }
);

export default http;

