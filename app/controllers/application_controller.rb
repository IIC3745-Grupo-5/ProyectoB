class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    def after_sign_in_path_for(resource)
        # Esto es válido dado que solo existe un cinema, no se me ocurre otra forma
        Cinema.all[0]
    end
end
