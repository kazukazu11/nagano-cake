class EndUsersController < ApplicationController
	before_action :authenticate_end_user!
	def show
		@end_user=current_end_user
	end
	def edit
		@end_user=EndUser.find(params[:id])
	end
	def update
		@end_user=EndUser.find(params[:id])
		@end_user.update(end_user_params)
		redirect_to end_user_path(@end_user.id)
	end
	def destroy
		@end_user=EndUser.find(params[:id])
		@end_user.update(status: false)
		@end_user.destroy
		redirect_to destroy_end_user_session_path
	end
	def leave
	end
	private
	def end_user_params
		params.require(:end_user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:phone_number,:postal_code,:address)
	end
end
