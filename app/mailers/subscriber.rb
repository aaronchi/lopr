class Subscriber < ActionMailer::Base
  
  default :from => "subscribe@loveonpurposerevolution.com>"
  
  def confirmation_instructions(user)
    list = 'lopr2012'
    @user = user
    mail(
      :to => "#{list}@aweber.com",
      :subject => "Subscribe #{user.to_email} to #{list}"
    )
  end

end