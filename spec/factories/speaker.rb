Factory.define :speaker do |s|
  s.name {Faker::Name.name}
  s.bio {Faker::Lorem.sentence(12)}
end