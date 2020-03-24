class CreateOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :amount
      t.integer :order_product_price
      t.integer :production_status,default: 0
      t.timestamps
    end
  end
end
