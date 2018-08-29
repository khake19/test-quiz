FactoryBot.define do
  factory :user_answer do
    answer { Faker::Matz.quote }
  end
end
