FactoryBot.define do
  factory :question do
    name { Faker::Matz.quote }
    answer { Faker::ChuckNorris.fact }
  end
end
