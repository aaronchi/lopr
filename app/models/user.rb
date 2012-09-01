class User < ActiveRecord::Base
  
  ## Model
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  
  ## Security
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  ## Associations
  has_many :orders
  
  def first_name
    name.split(' ').first
  end
  
  def to_email
    "#{name} <#{email}>"
  end
  
  def subscribe_to(list_id)
    api = Api::Aweber.new
    api.subscribe(user, list)
  end
  
  ## Enable password after confirmation
  
  # Password is required if it is being set
  def password_required?
    !password.nil? || !password_confirmation.nil?
  end
  
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  
  # Overide email confirmation if newsletter provider has been setup
  def send_on_create_confirmation_instructions
    if Rails.env.production?
      subscribe_to(Settings.aweber.list_id)
    else
      send_devise_notification(:confirmation_instructions)
    end
  end
  
end
