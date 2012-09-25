class DownloadsController < ApplicationController
  
  inherit_resources
  belongs_to :product
  
  before_filter :authenticate_user!, :only => :show
  before_filter :authenticate_buyer!, :only => :show
  
  def authenticate_buyer!
    redirect_to root_path unless current_user.admin? || current_user.orders.where(:product_id => parent.product_id).exists?
  end
  
  def show
    download = Download.find(params[:id])
    send_data open(download.asset).read, :filename => download.filename
  end
  
end