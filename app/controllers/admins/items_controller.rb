class Admins::ItemsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@items=Item.all
	end
	def new
		@item=Item.new
	end
	def create
		@item=Item.new(item_params)
		@item.save
		redirect_to admins_items_path
	end
	private
	def item_params
		params.require(:item).permit(:genre_id,:name,:description,:price_excluding_tax,:product_image,:sale_status)
	end
end
