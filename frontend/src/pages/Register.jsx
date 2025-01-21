// frontend/src/pages/RegisterPage.jsx
import React, { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { register } from '../services/auth';
import AuthLayout from '../components/AuthLayout';
import FormInput from '../components/FormInput';

const RegisterPage = () => {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({
        username: '',
        password: '',
        email: '',
        phone: ''
    });
    const [error, setError] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        setIsLoading(true);

        try {
            await register(formData);
            navigate('/login');
        } catch (err) {
            setError(err.response?.data?.error || '注册失败，请重试');
        } finally {
            setIsLoading(false);
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    return (
        <AuthLayout title="注册">
            <form onSubmit={handleSubmit} className="space-y-6">
                {error && (
                    <div className="bg-red-50 border-l-4 border-red-500 p-4 mb-4">
                        <p className="text-red-700">{error}</p>
                    </div>
                )}

                <FormInput
                    name="username"
                    type="text"
                    placeholder="用户名"
                    value={formData.username}
                    onChange={handleChange}
                    required
                    minLength="3"
                    maxLength="50"
                />

                <FormInput
                    name="password"
                    type="password"
                    placeholder="密码"
                    value={formData.password}
                    onChange={handleChange}
                    required
                    minLength="6"
                    maxLength="50"
                />

                <FormInput
                    name="email"
                    type="email"
                    placeholder="电子邮件"
                    value={formData.email}
                    onChange={handleChange}
                    required
                />

                <FormInput
                    name="phone"
                    type="tel"
                    placeholder="手机号码（选填）"
                    pattern="[0-9]{11}"
                    title="请输入11位手机号码"
                    value={formData.phone}
                    onChange={handleChange}
                />

                <button
                    type="submit"
                    disabled={isLoading}
                    className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 disabled:opacity-50"
                >
                    {isLoading ? '注册中...' : '注册'}
                </button>

                <div className="text-center mt-4">
                    <Link to="/login" className="text-blue-600 hover:text-blue-800">
                        已有账号？立即登录
                    </Link>
                </div>
            </form>
        </AuthLayout>
    );
};

export default RegisterPage;