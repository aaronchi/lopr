class Bonus < ActiveRecord::Base
  
  ## Model
  mount_uploader :image, ImageUploader
  acts_as_list
  
  ## Security
  attr_accessible :name, :short_description, :image, :image_cache, :download_attributes, :url, :as => :admin
  
  ## Associations
  has_one :download, :as => :downloadable
    accepts_nested_attributes_for :download
  
  ## Scope
  default_scope :order => 'position'
  
  def filename
    url.split('/').last
  end

end
