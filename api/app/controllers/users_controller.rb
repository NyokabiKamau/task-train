class UsersController < ApplicationController
    before_action :session_expired?, only: [:check_login_status]

    def register
        user = User.create(user_params)
        if user.valid?
            save_user(id: user.id)
            app_response(message: 'Registration was successful', data: user, status: :created)
        else
            app_response(message: 'Something went wrong during registration', data: user.errors, status: :unprocessable_entity)
        end
    end

    def login
        sql = "username = :username OR email = :email"
        user = User.where(sql, { username: user_params[:username], email: user_params[:email]}).first
        if user&.authenticate(user_params[:password])
            save_user(id: user.id)
            app_response(message: 'Registration was successful', data: user, status: :ok)
        else
            app_response(message: 'Invalid username/email or password', status: :unauthorized)
        end
    end 

    def logout
        remove_user
        app_response(message: 'Logout successful')
    end

    def check_login_status
        app_response(message: 'Success', status: :ok)
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end

end
