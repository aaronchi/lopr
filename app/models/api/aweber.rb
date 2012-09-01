module Api
  class Aweber
    
    def subscribe(user, list_id)
      post "/accounts/#{Settings.aweber.id}/lists/#{list_id}/subscribers", to_subscriber(user)
    end
    
    def lists
      get("/accounts/#{Settings.aweber.id}/lists")['entries'].map do |list|
        Hashie::Mash.new(:id => list['id'], :name => list['name'], :subscriber_count => list['total_subscribed_subscribers'])
      end
    end
    
    private
    
    def to_subscriber(user)
      {
        'ws.op' => 'create',
        'email' => user.email,
        'name' => user.name
      }
    end
    
    def get(path)
      MultiJson.load(client.request(:get, path).body)
    end
    
    def post(path, params)
      client.request(:post, path, params)
    end
  
    def client
      @client ||= OAuth::AccessToken.new(OAuth::Consumer.new(Settings.aweber.key, Settings.aweber.secret, {:site=>'https://api.aweber.com/1.0'}), Settings.aweber.access_token, Settings.aweber.access_secret)
    end
  end
end