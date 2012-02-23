module ApplicationHelper
  
  # Finds the correct form path for inherited_resources
  def form_resource_path
    resource.persisted? ? resource_path(resource) : collection_path
  end
  
end
