class AddDownloadToBonuses < ActiveRecord::Migration
  def change
    add_column :bonuses, :url, :string
    add_column :products, :redirect_url, :string
  end
end
