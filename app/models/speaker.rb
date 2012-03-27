class Speaker < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :name, :use => :slugged
  mount_uploader :avatar, AvatarUploader
  acts_as_list
  
  ## Security
  attr_accessible :name, :bio, :short_bio, :avatar, :avatar_cache, :as => :admin
  
  ## Associations
  has_many :products
  
end
