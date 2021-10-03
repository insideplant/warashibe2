class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]

  def after_sign_in_path_for(resource)
    if !current_user.target.present?
      newuser_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar,:name,:target])
    end
end
