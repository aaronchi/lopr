class Order < ActiveRecord::Base
  
  paginates_per 10
  
  attr_accessor :user_email
  attr_accessible :product_id, :user_id, :user_email, :as => :admin
  
  ## Associations
  belongs_to :product, :primary_key => :product_id
  belongs_to :user
  
  after_create :subscribe_user
  def subscribe_user
    user.subscribe('loprpurchases12')
  end
  
end
