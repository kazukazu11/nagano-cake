class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :end_user
end
