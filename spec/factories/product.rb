Factory.define :product do |s|
  s.name {Faker::Product.product_name}
  s.product_id 8989948
  s.cart_pid '3257e5ae83a44e40bd09200e4810949a'
  s.description {Faker::HTMLIpsum.p}
end