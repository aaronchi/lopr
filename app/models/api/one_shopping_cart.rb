module Api
  class OneShoppingCart < Weary::Client
    domain "https://www.mcssl.com/API"
    
    def initialize
      @defaults = {}
      @defaults[:uid] = Settings.oneshoppingcart.id
      @defaults[:key] = Settings.oneshoppingcart.key
    end
    
    get :products, "/{uid}/Products/LIST" do |resource|
      resource.required :key
    end
    
    get :notify, "/{uid}/Notifications/TEST" do |resource|
      resource.required :key
    end
    
    get :product, "/{uid}/Products/{id}" do |resource|
      resource.required :key, :id
    end
  end
end