class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price_excluding_tax
      t.string :product_image_id
      t.integer :sale_status,default: 1
      t.timestamps
    end
  end
end
