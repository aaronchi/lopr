class Admin::ApplicationController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  
  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end
  
end
