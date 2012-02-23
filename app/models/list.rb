class List

  LISTS = {
    'lopr2012' => "http://forms.aweber.com/form/81/592908581.htm",
    'loprpurchases12' => 'http://forms.aweber.com/form/47/1406356347.htm'
  }
  
  # def self.subscribe(name, user)
    # s = client.lists.find_by_name(name).subscribers
    # s.create(:name => user.name, :email => user.email)
  # end
  
  def self.subscribe(name, user)
    agent = Mechanize.new
    form = agent.get(LISTS[name]).forms.first
    form["name"] = user.name
    form["email"] = user.email
    agent.submit(form)
  end
  
  # def self.client
    # return @client if @client
    # oauth = AWeber::OAuth.new(Settings.aweber.key, Settings.aweber.secret)
    # oauth.authorize_with_access(Settings.aweber.access_token, Settings.aweber.access_secret)
    # aweber = AWeber::Base.new(oauth)
    # @client = aweber.account
  # end
  
end