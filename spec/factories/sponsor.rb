Factory.define :sponsor do |s|
  s.name {Faker::Company.name}
  s.url {Faker::Internet.http_url}
  s.slogan {Faker::Company.catch_phrase}
end