class AddDeletedAtToEndUser < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :deleted_at, :datetime
    add_index :end_users, :deleted_at
  end
end
