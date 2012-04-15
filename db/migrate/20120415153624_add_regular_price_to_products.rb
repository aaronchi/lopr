class AddRegularPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :regular_price, :float
    add_column :products, :youtube_id, :string
  end
end
