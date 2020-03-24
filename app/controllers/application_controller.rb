class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	autocomplete :item, :name, full: true
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:phone_number,:postal_code,:address])
	end
	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admins_items_path
		when EndUser
			end_user_path(current_end_user.id)
		end
	end
	def after_sign_out_path_for(resource)
		if resource == :admin
			new_admin_session_path
		else
			new_end_user_session_path
		end
	end
end
