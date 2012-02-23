class Admin::ResourcesController < Admin::ApplicationController
  
  inherit_resources
  actions :all, :except => [:show]
  with_role :admin
  
end