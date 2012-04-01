class AddPriceAndTitleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :title, :string
    add_column :products, :price, :float
  end
end
