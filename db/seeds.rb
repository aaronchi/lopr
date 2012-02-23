#s = Speaker.create({:name => 'Josie Keys'}, :without_protection => true)
#p = Product.create({:name => 'Test Product', :product_id => '8989948', :cart_pid => '3257e5ae83a44e40bd09200e4810949a', :speaker => s}, :without_protection => true)

time = Time.new(2012,4,1,22,00,0)
1.upto(25) do |i|
  e = Factory.build(:event, :name => "Teleconference #{i}", :start_time => time, :end_time => time+1.hour)
  e.speaker = Factory.build(:speaker)
  e.save
  s = e.speaker
  Factory.create(:product, :speaker => s)
  time = time + 1.day
end
12.times {Factory.create(:sponsor)}

User.create!({:name => 'Aaron', :email => 'aaronchi@gmail.com', :password => 'lopr2012', :confirmed_at => Time.now}, :without_protection => true)
