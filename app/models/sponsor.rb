class Sponsor < ActiveRecord::Base
  
  ## Model
  mount_uploader :image, ImageUploader
  acts_as_list

  ## Security
  attr_accessible :name, :url, :slogan, :description, :image, :image_cache, :as => :admin
  
  ## Validations
  validates_presence_of :name, :url
  validates_url :url, :allow_blank => true
  
  ## Scopes
  default_scope :order => 'position'
  
end
