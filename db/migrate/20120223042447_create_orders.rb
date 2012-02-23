class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.integer :order_id
      t.integer :product_id
      t.decimal :total, :precision => 6, :scale => 2
      t.string :status
      t.timestamps
    end
    add_index :orders, :order_id
    add_index :orders, :product_id
  end
end
