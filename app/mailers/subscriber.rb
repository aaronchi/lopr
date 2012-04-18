class Subscriber < ActionMailer::Base
  include Devise::Mailers::Helpers
  
  default :from => "support@loveonpurposerevolution.com"
  
  def confirmation_instructions(user)
    list = 'lopr2012'
    @user = user
    mail(
      :to => "#{list}@aweber.com",
      :subject => "Subscribe #{user.to_email} to #{list}"
    )
  end
  
  def reset_password_instructions(record)
    devise_mail(record, :reset_password_instructions)
  end

  def unlock_instructions(record)
    devise_mail(record, :unlock_instructions)
  end

end