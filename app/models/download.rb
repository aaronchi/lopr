class Download < ActiveRecord::Base
  
  
  ## Model  
  mount_uploader :asset, DownloadUploader
  validates_presence_of :asset
  as_enum :download_type, :audio => 1, :transcript => 2
  
  ## Security
  attr_accessible :asset, :remote_asset_url, :as => :admin
  
  ## Associations
  belongs_to :downloadable, :polymorphic => true
  
  def filename
    read_attribute(:asset)
  end
  
  private
  
end
