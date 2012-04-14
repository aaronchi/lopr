module ApplicationHelper
  
  # Finds the correct form path for inherited_resources
  def form_resource_path
    resource.persisted? ? resource_path(resource) : collection_path
  end
  
  def download_bonus_path(bonus)
    bonus.download ? bonus_path(bonus) : bonus.url
  end
  
  def embed_video(id)
    autoplay = current_user && current_user.sign_in_count > 1 ? 0 : 1
    %(<iframe width="560" height="315" src="http://www.youtube.com/embed/#{id}?rel=0&autoplay=#{autoplay}" frameborder="0" allowfullscreen></iframe>).html_safe
  end
  
end
