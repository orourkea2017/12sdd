class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/signup'
        end
    end

    def show
        @user = User.find_by_username(params[:id])
        @title = @user.username + " // The Komplex"
    end  

    private
        def user_params
            params.require(:user).permit(:fullname, :email, :username, :password, :password_confirmation, :likes, :dislikes)
        end
end
