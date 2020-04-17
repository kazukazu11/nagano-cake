class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :receiver
      t.string :postal_code
      t.string :address
      t.integer :total_billed_amount
      t.integer :postage
      t.integer :order_status,default: 0
      t.integer :payment_method
      t.timestamps
    end
  end
end
