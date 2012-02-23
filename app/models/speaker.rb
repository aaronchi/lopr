class Speaker < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :name, :use => :slugged
  mount_uploader :image, ImageUploader
  
  ## Security
  attr_accessible :name, :bio, :image, :image_cache, :as => :admin
  
  ## Associations
  has_many :products
  
end
