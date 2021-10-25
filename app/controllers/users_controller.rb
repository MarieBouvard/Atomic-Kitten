class UsersController < ApplicationController

    def show
    end

    def edit
    end

    def update
        @user = current_user
    user_params =  params.require(:user).permit(:first_name, :last_name, :email, :description, :adress)
    @user.update(user_params)
    end

    def create
        @user = User.new(user_params)
        @user.save
        unless  @user.save
          @error_message = errors.full_messages.compact
        end
      end

    private 

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end