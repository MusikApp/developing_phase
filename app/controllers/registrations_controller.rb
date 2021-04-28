class RegistrationsController < Devise::RegistrationsController

    protected
  
      def after_update_path_for(current_user)
        profile_path
      end
  end