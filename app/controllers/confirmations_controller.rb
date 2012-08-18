# Stolen from:
# https://github.com/plataformatec/devise/wiki/How-To:-Override-confirmations-so-users-can-pick-their-own-passwords-as-part-of-confirmation-activation
class ConfirmationsController < Devise::ConfirmationsController
  
  def callback
    user = User.find_by_email(params[:email])
    if user && !user.confirmed?
      redirect_to confirmation_url(user, :confirmation_token => user.confirmation_token)
    else
      redirect_to root_path
    end
  end
  
  # PUT /resource/confirmation
  def update
    with_unconfirmed_confirmable do
      if @confirmable.update_attributes(params[:user])
        do_confirm
      else
        do_show
      end
    end
  end

  def show
    with_unconfirmed_confirmable do
      if @confirmable.encrypted_password.blank?
        do_show
      else
        do_confirm
      end
    end
    if !@confirmable.errors.empty?
      render :new
    end
  end

  protected
  
  def with_unconfirmed_confirmable
    @confirmable = User.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token])
    if @confirmable.persisted?
      @confirmable.only_if_unconfirmed {yield}
    end
  end

  def do_show
    self.resource = @confirmable
    render :show
  end

  def do_confirm
    @confirmable.confirm!
    set_flash_message :notice, :confirmed
    sign_in('user', @confirmable) 
    redirect_to root_url
  end

  def after_resending_confirmation_instructions_path_for(resource_name)
    new_session_path(:user)
  end
  
end