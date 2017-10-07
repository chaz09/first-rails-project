class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
end

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
end


 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email) }
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }

end
