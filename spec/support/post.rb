FactoryGirl.define do
  factory :post do
    title Faker::Lorem::words(3)
  end
end