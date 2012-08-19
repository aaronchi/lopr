module Api
  class OneShoppingCart < Weary::Client
    domain "https://www.mcssl.com/API"
    
    def initialize
      @defaults = {}
      @defaults[:uid] = Settings.oneshoppingcart.id
      @defaults[:key] = Settings.oneshoppingcart.key
    end
    
    get :products, "/{uid}/Products/List" do |resource|
      resource.required :key
    end
    
    get :product, "/{uid}/Products/{id}/Read" do |resource|
      resource.required :key, :id
    end
  end
end