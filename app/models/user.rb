class User < ActiveRecord::Base
  
  ## Model
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  ## Security
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  ## Validations
  validates_presence_of :name
  
  ## Scopes
  scope :unsubscribed, where(:subscribed => false, :confirmation_token => nil)
  
  def first_name
    name.split(' ').first
  end
  
  ## Sign up to email list after confirm
  def confirm!
    self.subscribed = subscribe('lopr2012')
    super
  end
  
  def to_email
    "#{name} <#{email}>"
  end
  
  ## SUBSCIBES
  LISTS = {
    'lopr2012' => "http://forms.aweber.com/form/81/592908581.htm",
    'loprpurchases12' => 'http://forms.aweber.com/form/47/1406356347.htm'
  }
  
  def subscribe(list)
    agent = Mechanize.new
    agent.set_proxy('127.0.0.1', 8118) if Rails.env.development?
    agent.keep_alive = false
    begin
      form = agent.get(LISTS[list]).forms.first
      form["name"] = name
      form["email"] = email
      response = agent.submit(form)
      success = response.uri.to_s.include?('thankyou') || response.uri.to_s.include?('already_subscribed')
      logger.error "Subscribe Error: #{email} - #{response.uri.to_s}" unless success
      User.switch_ip if Rails.env.development?
      return success
    rescue => ex
      Airbrake.notify(ex) if Rails.env.production?
      return false
    end
  end
  
  require 'net/telnet'
  def self.switch_ip
    t = TCPSocket.new("localhost",'9051')
    t.puts("authenticate\r\n")
    t.puts("signal NEWNYM\r\n")
    t.puts("quit\r\n")
  end
  
  require 'csv'
  def self.sync
    ActiveRecord::Base.record_timestamps = false
    CSV.foreach("#{Rails.root}/db/aweber.csv", :headers => true, :write_headers => false) do |row|
      user = User.find_by_email(row[0])
      user.update_attribute(:subscribed, true) if user
    end
    ActiveRecord::Base.record_timestamps = true
  end
  
  def self.resubscribe
    User.unsubscribed.limit(10).each do |u|
      u.update_attribute :subscribed, u.subscribe('lopr2012')
      sleep 2 + Random.rand(11)
    end
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
