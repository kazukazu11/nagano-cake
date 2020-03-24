class Order < ApplicationRecord
	belongs_to :end_user
	has_many :orders_details, dependent: :destroy
	enum payment_method: { credit: 0, bank: 1 }
	enum order_status: { wait:0 , confirm: 1, make: 2, prepare: 3, complete: 4 }
end
