class ApplicationController < ActionController::Base
    
    helper_method :current_user
    helper_method :logged_in?
    helper_method :require_user
    helper_method :require_registrar_admin
    
    
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end
    end
    
    def logged_in?
        !!current_user
    end
    
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
    
    def require_registrar_admin
        if current_user.access_level != "Admin" && current_user.access_level != "Registrar"
            flash[:alert] = "You do not have permission to do this action"
            redirect_to root_path
        end
    end
    
    def require_admin
        if current_user.access_level != "Admin"
            flash[:alert] = "You do not have permission to do this action"
            redirect_to root_path
        end
    end
    
end
