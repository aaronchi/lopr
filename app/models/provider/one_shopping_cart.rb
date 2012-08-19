module Provider
  class OneShoppingCart
  
    def products
      Rails.cache.fetch "products/#{Settings.oneshoppingcart.id}", :expires_in => 15.minutes do
        client.products.perform.parse["Response"]["Products"]["Product"].map do |link|
          to_product(client.product(:id => link["__content__"]).perform.parse["Response"]["ProductInfo"])
        end
      end
    end
    
    def product(id)
      to_product(client.product(:id => id).perform.parse["Response"]["ProductInfo"])
    end
    
    private
    
    def to_product(product)
      {:name => product["ProductName"], :price => product["ProductPrice"], :product_id => product["Id"], :cart_pid => product["VisibleId"]}
    end
    
    def client
      @client ||= Api::OneShoppingCart.new
    end
    
  end
end