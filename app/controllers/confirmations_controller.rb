# Stolen from:
# https://github.com/plataformatec/devise/wiki/How-To:-Override-confirmations-so-users-can-pick-their-own-passwords-as-part-of-confirmation-activation

class ConfirmationsController < Devise::ConfirmationsController
  # Remove the first skip_before_filter (:require_no_authentication) if you
  # don't want to enable logged users to access the confirmation page.
  skip_before_filter :require_no_authentication
  skip_before_filter :authenticate_user!

  # PUT /resource/confirmation
  def update
    if resource.update_attributes(params[:user])
      do_confirm
    else
      do_show
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show 
    render resource.persisted? ? :show : :new
  end

  protected
  
  def resource
    @confirmable ||= User.where(:confirmation_token => params[:confirmation_token]).first_or_initialize
  end

  def do_show
    render :show
  end

  def do_confirm
    @confirmable.confirm!
    set_flash_message :notice, :confirmed
    sign_in_and_redirect(resource_name, @confirmable)
  end
end