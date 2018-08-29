FactoryBot.define do
  factory :quiz do
    name   { Faker::Matz.quote }
    description { Faker::ChuckNorris.fact }
  end
end
