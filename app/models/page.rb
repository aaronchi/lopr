class Page < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :title, :use => :slugged
  acts_as_list
  
  ## Security
  attr_accessible :title, :body, :active, :as => :admin
  
  ## Scope
  default_scope :order => 'position'
  scope :active, where(:active => true)
  
  def name
    title
  end
  
end
