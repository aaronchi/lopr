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
    uploader = download.asset 
    uploader.retrieve_from_store!(File.basename(download.asset.url))
    uploader.cache_stored_file!
    send_file uploader.file.path
  end
  
end