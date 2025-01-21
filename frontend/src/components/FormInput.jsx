// frontend/src/components/FormInput.jsx
import React from 'react';

const FormInput = ({ label, error, ...props }) => {
    return (
        <div className="mb-4">
            {label && (
                <label className="block text-gray-700 text-sm font-bold mb-2">
                    {label}
                </label>
            )}
            <input
                className={`shadow appearance-none border ${
                    error ? 'border-red-500' : ''
                } rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline`}
                {...props}
            />
            {error && <p className="text-red-500 text-xs italic">{error}</p>}
        </div>
    );
};

export default FormInput;