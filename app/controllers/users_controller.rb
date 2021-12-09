class UsersController < ApplicationController
    
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
            flash[:notice] = "User was created successfully"
        else 
            render 'new'
        end
    end
    
    private
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
    end
    
    def show
        
    end
end