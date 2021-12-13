class UsersController < ApplicationController
    
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:show, :edit, :update, :destroy, :new, :create, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy, :new, :create, :index]
    
    
    
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
    
    def update
        if @user.update(user_params)
            flash[:notice] = "User was updated successfully"
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def index
        @users = User.paginate(page: params[:page], per_page: 15)
    end
    
    def edit 
    end
    
    def destroy 
        @user.destroy
        redirect_to users_path
    end
    
    private
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :access_level)
    end
    
    def require_same_user
        if current_user != @user
            flash[:alert] = "You do not permission to do this action"
            redirect_to root_path
        end
    end
    
end