class User < ActiveRecord::Base
  
  ## Model
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  ## Security
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  ## Validations
  validates_presence_of :name
  
  def first_name
    name.split(' ').first
  end
  
  ## Sign up to email list after confirm
  def confirm!
    List.subscribe('lopr2012', self) rescue nil
    super
  end
  ## Enable password after confirmation
  
  # Password is required if it is being set, but not for new records
  def password_required?
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end
  
  # new function to set the password without knowing the current password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end
  
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end
  
  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  
end
