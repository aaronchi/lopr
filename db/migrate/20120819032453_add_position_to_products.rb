class AddPositionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :position, :integer
    Product.reset_column_information
    Product.order('id').each_with_index do |p,i|
      p.update_column :position, i+1
    end
  end
end
