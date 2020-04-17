class AddressesController < ApplicationController
	def index
		@address=Address.new
		@addresses=Address.all
	end
	def create
		@address=Address.new(address_params)
		@address.end_user_id=current_end_user.id
		@address.save
		redirect_to addresses_path
	end
	def update
		@address=Address.find(params[:id])
		@address.update(address_params)
		redirect_to addresses_path
	end
	def destroy
		@address=Address.find(params[:id])
		@address.destroy
		redirect_to addresses_path
	end
	def edit
		@address=Address.find(params[:id])
	end
	private
	def address_params
		params.require(:address).permit(:receiver,:postal_code,:street_address)
	end
end
