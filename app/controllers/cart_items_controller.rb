class CartItemsController < ApplicationController
	before_action :authenticate_end_user!
	def index
		@cart_items=CartItem.all
	end
	def create
		@cart_item=CartItem.new(cart_item_params)
		@cart_item.end_user_id = current_end_user.id
		@cart_item.save
		redirect_to cart_items_path
	end
	def update
		@cart_item=CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path
	end
	def destroy
		@cart_item=CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path
	end
	def destroy_all
		@cart_items=CartItem.all
		@cart_items.destroy_all
		redirect_to cart_items_path
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:amount,:item_id)
	end
end
 