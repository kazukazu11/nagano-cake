class OrdersController < ApplicationController
	before_action :authenticate_end_user!
	before_action :order_params1, only: [:confirm]
	before_action :order_params, only: [:confirm]
	before_action :cart_check, only: [:new]
	def cart_check
		@cart_items=CartItem.all
		if @cart_items.empty?
			redirect_to items_path
		end
	end
	def new
		@order=Order.new
		@cart_items=current_end_user.cart_items
	end
	def confirm
		@order_detail=OrdersDetail.new
		@cart_items=current_end_user.cart_items
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
		end
		render :confirm
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
			@order_confirm=Order.new(order_confirm_params)
			@order_confirm.save
			redirect_to orders_done_path
		end
	end
	private
	def order_params1
		params.require(:order).permit(:total_billed_amount,:payment_method)
	end
	def order_params
		params.require(:order).permit(:receiver,:postal_code,:address,:total_billed_amount,:payment_method)
	end
	def order_confirm_params
		params.require(:order).permit(:end_user_id,:receiver,:postal_code,:address,:total_billed_amount,:postage,:order_status,:payment_method,orders_details_attributes:[:item_id,:order_id,:amount,:order_product_price])
	end
end
