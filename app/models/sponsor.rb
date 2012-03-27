class Sponsor < ActiveRecord::Base
  
  ## Model
  mount_uploader :image, SponsorUploader

  ## Security
  attr_accessible :name, :url, :slogan, :description, :image, :image_cache, :as => :admin
  
  ## Validations
  validates_presence_of :name, :url
  validates_url :url, :allow_blank => true
  
end
