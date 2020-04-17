class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index 
		@orders=Order.all
		@end_users=EndUser.with_deleted
		# binding.pry
	end
	def show
		@order=Order.find(params[:id])
		@end_users=EndUser.with_deleted
	end
	def update
		@order=Order.find(params[:id])
		@order.update(order_params)
		redirect_to admins_order_path(@order.id)
	end
	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
