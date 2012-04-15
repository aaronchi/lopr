class Product < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :name, :use => :slugged
  mount_uploader :image, ImageUploader
  
  ## Security
  attr_accessible :name, :title, :price, :regular_price, :product_id, :cart_pid, :youtube_id, :speaker_id, :short_description, :description, :image, :image_cache, :redirect_url, :as => :admin
  
  ## Associations
  belongs_to :speaker
  has_many :orders, :primary_key => :product_id
  
  ## Validations
  validates_presence_of :name, :product_id, :cart_pid
  
  ## Scope
  scope :global, where(:speaker_id => nil)
  
  ## Methods
  def purchase_url
    "http://www.1shoppingcart.com/SecureCart/SecureCart.aspx?mid=2FD65AE0-2662-4077-9A2F-360D2DE2C34B&pid=#{cart_pid}&bn=1"
  end
  
end
