class AddDownloadTypeCdToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :download_type_cd, :integer
  end
end
