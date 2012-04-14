class AddDescriptionToProducts < ActiveRecord::Migration
  def change
    rename_column :products, :description, :short_description
    add_column :products, :description, :text
  end
end
