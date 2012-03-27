class Speaker < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :name, :use => :slugged
  mount_uploader :image, AvatarUploader
  acts_as_list
  
  ## Security
  attr_accessible :name, :bio, :short_bio, :image, :image_cache, :as => :admin
  
  ## Associations
  has_many :products
  
  ## Validations
  validates_presence_of :name
  
  ## Scopes
  default_scope :order => 'position'
  
end
