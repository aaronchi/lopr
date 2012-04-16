class Order < ActiveRecord::Base
  
  ## Associations
  belongs_to :product, :primary_key => :product_id
  belongs_to :user
  
  after_create :subscribe_user
  def subscribe_user
    user.subscribe('loprpurchases12')
  end
  
end
