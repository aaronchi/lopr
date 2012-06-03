class Admin::ResourcesController < Admin::ApplicationController
  
  inherit_resources
  respond_to :js
  actions :all, :except => :show
  with_role :admin
  
end