module ApplicationHelper
  
  # Finds the correct form path for inherited_resources
  def form_resource_path
    resource.persisted? ? resource_path(resource) : collection_path
  end
  
  def download_bonus_path(bonus)
    bonus.download ? bonus_path(bonus) : bonus.url
  end
  
end
