class Product < ActiveRecord::Base
  
  ## Mmodel
  extend FriendlyId
  friendly_id :name, :use => :slugged
  acts_as_list :scope => :speaker_id
  
  ## Security
  attr_accessible :name, :title, :price, :regular_price, :product_id, :cart_pid, :digital_download, :youtube_id, :speaker_id, :short_description, :description, :redirect_url, :images_attributes, :as => :admin
  
  ## Associations
  belongs_to :speaker
  has_many :orders, :primary_key => :product_id
  has_many :images, :as => :imageable
    accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => lambda { |a| a[:image].blank? }
  
  ## Validations
  validates_presence_of :product_id
  validates_url :redirect_url, :allow_blank => true
  
  ## Scope
  default_scope :order => 'position'
  scope :global, where(:speaker_id => nil)
  
  ## Callbacks
  before_validation :sync
  def sync
    self.assign_attributes(Provider::OneShoppingCart.new.product(product_id), :without_protection => true)
  end
  
  ## Methods
  def purchase_url
    "http://www.1shoppingcart.com/SecureCart/SecureCart.aspx?mid=#{Settings.oneshoppingcart.mid}&pid=#{cart_pid}&bn=1"
  end
  
end
