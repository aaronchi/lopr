class Product < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  ## Security
  attr_accessible :name, :title, :price, :regular_price, :product_id, :cart_pid, :youtube_id, :speaker_id, :short_description, :description, :redirect_url, :images_attributes, :as => :admin
  
  ## Associations
  belongs_to :speaker
  has_many :orders, :primary_key => :product_id
  has_many :images, :as => :imageable
    accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => lambda { |a| a[:image].blank? }
  
  ## Validations
  validates_presence_of :name, :product_id, :cart_pid
  validates_url :redirect_url, :allow_blank => true
  
  ## Scope
  scope :global, where(:speaker_id => nil)
  
  ## Methods
  def purchase_url
    "http://www.1shoppingcart.com/SecureCart/SecureCart.aspx?mid=2FD65AE0-2662-4077-9A2F-360D2DE2C34B&pid=#{cart_pid}&bn=1"
  end
  
end
