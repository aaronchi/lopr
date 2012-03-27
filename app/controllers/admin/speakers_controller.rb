class Admin::SpeakersController < Admin::ResourcesController
  
  def sort
    params[:speaker].each_with_index do |id, position|
      collection.find(id).update_attribute(:position, position + 1)
    end
    render :nothing => true
  end
  
end