class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :speaker
      t.string :name
      t.integer :product_id
      t.string :cart_pid
      t.text :description
      t.string :image
      t.string :slug
      t.timestamps
    end
    add_index :products, :product_id
    add_index :products, :slug, :unique => true
  end
end
