FactoryBot.define do
  factory :question do
    content { Faker::Matz.quote }
    answer  { Faker::ChuckNorris.fact }
  end
end
