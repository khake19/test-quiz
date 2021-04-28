FactoryBot.define do
  factory :question do
    content { Faker::Name.name_with_middle }
    answer  { Faker::ChuckNorris.fact }
  end
end
