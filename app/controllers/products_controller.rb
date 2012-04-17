class ProductsController < ApplicationController
  
  inherit_resources
  skip_before_filter :verify_authenticity_token, :only => :callback
  before_filter :authenticate_user!
  before_filter :authenticate_buyer!, :only => :show
  
  def authenticate_buyer!
    redirect_to root_path unless current_user.orders.where(:product_id => resource.product_id).exists?
  end
  
  def buy
    #TODO: Set any session vars here if we need to
    session[:user_id] = current_user.id
    redirect_to resource.purchase_url
  end
  
  def callback
    order = Order.where(:order_id => params['orderID']).first_or_create({
      :user_id => current_user.id,
      :product_id => params['plist'],
      :total => params['Total'],
      :status => params['status']
    }, :without_protection => true)
    product = Product.find_by_product_id(params['plist'])
    redirect_to product.redirect_url.blank? ? product_path(product) : product.redirect_url
  end
  
  def download
    send_file '/home/railsway/downloads/huge.zip', :type=>"application/zip", :x_sendfile => true
  end
  
  #{"orderID"=>"191261816", "name"=>"Aaron Eisenberger", "company"=>"", "email1"=>"aaronchi@gmail.com", "address1"=>"1724 Arizona Ave #5", "address2"=>"", "city"=>"Santa Monica", "state"=>"California", "zip"=>"90404", "country"=>"United States", "fax"=>"", "phone"=>"415-819-5723", "secondaryphone"=>"", "cardtype"=>"", "shipname"=>"Aaron Eisenberger", "shipCompany"=>"", "shipAddress1"=>"1724 Arizona Ave #5", "shipAddress2"=>"", "shipCity"=>"Santa Monica", "shipState"=>"California", "shipZip"=>"90404", "shipCountry"=>"United States", "status"=>"Accepted", "sku1"=>"LOPR01", "product1"=>"Test Product", "quantity1"=>"1", "price1"=>"0.00", "plist"=>"8989948", "Total"=>"0.00", "grandTotal"=>"0.00", "adtrack"=>"0", "format"=>"php", "controller"=>"products", "action"=>"callback"}
  
end