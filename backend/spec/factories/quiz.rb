FactoryBot.define do
  factory :quiz do
    name   { Faker::Matz.quote }
    description { Faker::ChuckNorris.fact }

    before :create do |quiz|
      question = create :question
      quiz.questions << question
    end
  end
end
