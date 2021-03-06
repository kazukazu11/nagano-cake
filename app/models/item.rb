class Item < ApplicationRecord
	attachment :product_image
	enum sale_status: { 販売停止中: 0, 販売中: 1 }
	has_many :cart_items, dependent: :destroy
	has_many :orders_details, dependent: :destroy
end
