class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :authenticate_user!

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
  		if current_user.admin?
  			questions_path
  		else
  			survey_responses_path
  		end
	end

	protected

	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	# 		user_params.permit!(:email, :password, :password_confirmation)
	# 	end
	# end
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :admin])
  end
end
