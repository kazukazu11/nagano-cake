class OrdersDetailsController < ApplicationController
	def create
		@order_detail=Order.new(order_detail_params)
	end
	private
	def order_detail_params
		params.require(:order_detail).permit(:item_id)
	end
end
