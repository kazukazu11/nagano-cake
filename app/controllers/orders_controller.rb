class OrdersController < ApplicationController
	before_action :authenticate_end_user!
	def new
		@order=Order.new
		@cart_items=current_end_user.cart_items
	end
	def confirm
		@cart_items=current_end_user.cart_items
		@order_last=Order.last
	end
	def done
	end
	def create
		if params[:select] == "1"
			@order=Order.new(order_params1)
			@order.end_user_id=current_end_user.id
			@order.postage=800
			@order.receiver=params[:receiver1]
			@order.postal_code=params[:postal_code1]
			@order.address=params[:address1]
		elsif params[:select] == "2"
			@order=Order.new(order_params1)
			@order.end_user_id=current_end_user.id
			@order.postage=800
			@address=Address.find_by(postal_code: params[:address_id])
			@order.receiver=@address.receiver
			@order.postal_code=@address.postal_code
			@order.address=@address.street_address
		elsif params[:select] == "3"
			@order=Order.new(order_params)
			@order.end_user_id=current_end_user.id
			@order.postage=800
		else
			@order=Order.new(order_params)
			@order.end_user_id=current_end_user.id
			@order.postage=800
		end
		@order.save
        redirect_to orders_confirm_path
	end
	private
	def order_params1
		params.require(:order).permit(:total_billed_amount,:payment_method)
	end
	def order_params
		params.require(:order).permit(:receiver,:postal_code,:address,:total_billed_amount,:payment_method)
	end
end
