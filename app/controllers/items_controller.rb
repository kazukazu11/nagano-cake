class ItemsController < ApplicationController
	before_action :authenticate_end_user,only: [:show]
	def index
		if params[:item] && params[:item][:name]
			item_name = params[:item][:name]
			@items = Item.where("name LIKE '%#{item_name}%'")
		else
			@items=Item.all
		end
	end
	def show
		@item=Item.find(params[:id])
		@cart_item=CartItem.new
	end
	def authenticate_end_user
		if end_user_signed_in?
		else
			redirect_to items_path
		end
	end
end
 