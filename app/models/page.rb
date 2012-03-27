class Page < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  ## Security
  attr_accessible :title, :body, :as => :admin
  
  def name
    title
  end
  
end
