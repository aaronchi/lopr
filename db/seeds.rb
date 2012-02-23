s = Speaker.create({:name => 'Josie Keys'}, :without_protection => true)
p = Product.create({:name => 'Test Product', :product_id => '8989948', :cart_pid => '3257e5ae83a44e40bd09200e4810949a', :speaker => s}, :without_protection => true)
