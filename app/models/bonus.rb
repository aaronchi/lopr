class Bonus < ActiveRecord::Base
  
  ## Mmodel
  mount_uploader :image, ImageUploader
  acts_as_list
  
  ## Security
  attr_accessible :name, :short_description, :image, :image_cache, :as => :admin
  
  ## Scope
  default_scope :order => 'position'

end
