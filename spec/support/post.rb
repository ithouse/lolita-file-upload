Factory.define(:post) do |f|
  f.title Faker::Lorem::words(3)
end