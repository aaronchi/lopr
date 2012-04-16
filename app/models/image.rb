class Image < ActiveRecord::Base
  
  ## Model
  mount_uploader :image, ImageUploader
  
  ## Security
  attr_accessible :image, :image_cache, :as => :admin
  
  ## Associations
  belongs_to :downloadable, :polymorphic => true
  
  ## Callbacks
  after_create :set_name
  def set_name
    self.update_attribute :name, image.file.filename.gsub(".#{image.file.extension}",'').titleize
  end
  
  ## Methods
  def to_upload
    {:image => {:url => image_url}}
  end
  
end
