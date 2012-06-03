class Admin::OrdersController < Admin::ResourcesController
  
  autocomplete :user, :email
  
  protected
  
  def collection
    Order.includes(:product, :user).order('created_at desc').page(params[:page])
  end
  
end