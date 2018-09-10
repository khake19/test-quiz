FactoryBot.define do
  factory :quiz_attempt do
    association :question, factory: :question

    correct_answers  { Faker::Number.number(10) }
    incorrect_answers  { Faker::Number.number(5) }
  end
end
