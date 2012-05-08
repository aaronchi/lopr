class AddDigitalDownloadToProducts < ActiveRecord::Migration
  def change
    add_column :products, :digital_download, :boolean, :null => false, :default => true
  end
end
