class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  before_filter :set_timezone
  
  def set_timezone
    Time.zone = "Pacific Time (US & Canada)"
  end
  
end
