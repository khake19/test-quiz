FactoryBot.define do
  factory :quiz_attempt do
    association :quiz, factory: :quiz

    correct_answers  { Faker::Number.number(10) }
    incorrect_answers  { Faker::Number.number(5) }
  end
end
