class Page < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  ## Security
  attr_accessible :title, :body, :active, :as => :admin
  
  ## Scope
  scope :active, where(:active => true)
  
  def name
    title
  end
  
end
