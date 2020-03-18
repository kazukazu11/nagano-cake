class Admins::EndUsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@end_users=EndUser.with_deleted
	end
end
