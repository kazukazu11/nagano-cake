class Item < ApplicationRecord
	attachment :product_image
	enum sale_status: { 販売停止中: 0, 販売中: 1 }
end
