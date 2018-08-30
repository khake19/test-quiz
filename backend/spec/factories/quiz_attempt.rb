FactoryBot.define do
  factory :quiz_attempt do
    quiz_id { Faker::Number.number(10) }
    correct_answers  { Faker::Number.number(10) }
    incorrect_answers  { Faker::Number.number(5) }
  end
end
