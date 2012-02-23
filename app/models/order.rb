class Order < ActiveRecord::Base
  
  ## Associations
  belongs_to :product, :primary_key => :product_id
  
end
