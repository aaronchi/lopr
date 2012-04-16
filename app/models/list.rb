class List

  LISTS = {
    'lopr2012' => [
      "http://forms.aweber.com/form/81/592908581.htm",
      "http://forms.aweber.com/form/35/840018935.htm",
      "http://forms.aweber.com/form/04/1679391004.htm",
      "http://forms.aweber.com/form/19/1099387019.htm",
      "http://forms.aweber.com/form/90/1391951690.htm"
    ],
    'loprpurchases12' => ['http://forms.aweber.com/form/47/1406356347.htm']
  }
  
  # def self.subscribe(name, user)
    # s = client.lists.find_by_name(name).subscribers
    # s.create(:name => user.name, :email => user.email)
  # end
  
  def self.subscribe(name, user)
    agent = Mechanize.new
    begin
    form = agent.get(LISTS[name][Random.rand(LISTS[name].size)]).forms.first
    form["name"] = user.name
    form["email"] = user.email
    response = agent.submit(form)
    rescue
      return false
    end
    raise response.uri.to_s
    return response.uri.to_s
  end 
  
  def self.resubscribe
    User.unsubscribed.limit(1).each do |u|
      u.subscribe
    end
  end
  
  # def self.client
    # return @client if @client
    # oauth = AWeber::OAuth.new(Settings.aweber.key, Settings.aweber.secret)
    # oauth.authorize_with_access(Settings.aweber.access_token, Settings.aweber.access_secret)
    # aweber = AWeber::Base.new(oauth)
    # @client = aweber.account
  # end
  
end