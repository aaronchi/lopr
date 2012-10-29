class Order < ActiveRecord::Base
  
  paginates_per 10
  
  attr_accessor :user_email
  attr_accessible :product_id, :user_id, :user_email, :as => :admin
  
  ## Validations
  validates_presence_of :user_id, :product_id
  
  ## Associations
  belongs_to :product, :primary_key => :product_id
  belongs_to :user
  
  # after_create :subscribe_user
  # def subscribe_user
    # user.subscribe('loprpurchases12')
  # end
  
end
