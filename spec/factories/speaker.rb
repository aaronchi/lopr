Factory.define :speaker do |s|
  s.name {Faker::Name.name}
  s.short_bio {Faker::Lorem.sentence(12)}
  s.bio {Faker::Lorem.paragraphs(3).join("\n\n")}
end