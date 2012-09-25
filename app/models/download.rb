class Download < ActiveRecord::Base
  
  
  ## Model  
  #mount_uploader :asset, DownloadUploader
  validates_presence_of :asset
  as_enum :download_type, :audio => 1, :transcript => 2
  
  ## Security
 
  attr_accessor :remote_asset_url
  attr_accessible :asset, :remote_asset_url, :as => :admin
  
  ## Associations
  belongs_to :downloadable, :polymorphic => true
  
  #before_validation :set_asset
  def remote_asset_url=(val)
    file = Sfile.new(val, open(val).read)
    self.asset = val
    self.file_size = file.size
    self.content_type = MIME::Types.type_for(file.original_filename).first.content_type
  end
  
  def filename
    File.basename(asset)
  end
  
  def file
    open(asset)
  end 
  
  private
  
end
