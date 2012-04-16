class Admin::ImagesController < Admin::ResourcesController
  
  respond_to :js, :json
  skip_before_filter :verify_authenticity_token, :only => :upload
  
  def upload
    @image = Image.create({:image => params["file"]}, :as => :admin)
    render :text => @image.to_upload.to_json
  end

end