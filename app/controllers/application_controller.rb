class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters   
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:avatar, :username, :name, :last_name, :email, :password, :password_confirmation)  
        end

        devise_parameter_sanitizer.permit(:account_update) do |user| 
            user.permit(:avatar, :username, :name, :description, :last_name, :email, :password, :password_confirmation, :current_password) 
        end
    end

    def after_sign_out_path_for(current_user)
        new_user_session_path
    end
end
