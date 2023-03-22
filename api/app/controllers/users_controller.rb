class UsersController < ApplicationController

    def register
        user = User.create(user_params)
        if user.valid?
            app_response(message: 'Registration was successful', data: user, status: :created)
        else
            app_response(message: 'Something went wrong during registration', data: user.errors, status: :unprocessable_entity)
        end
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end
end
