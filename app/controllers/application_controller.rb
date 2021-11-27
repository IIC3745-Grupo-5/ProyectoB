class ApplicationController < ActionController::Base
    
    protected
    def authenticate_user!
        redirect_to home_index_path, notice: "You must login" unless user_signed_in? 
    end

    def after_sign_in_path_for(resource)
        Cinema
    end
end
