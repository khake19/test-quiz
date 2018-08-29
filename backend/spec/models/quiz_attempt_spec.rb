require 'rails_helper'

describe QuizAttempt, type: :model do
  context "association" do
    it "belongs to a Quizz" do
      (QuizAttempt.reflect_on_association(:quiz).macro).to eq(:belongs_to)
    end
  end

  context 'validations' do
    it "presence of correct_answers" do
      should validate_presence_of(:correct_answers)
    end

    it "presence of incorrect_answers" do
      should validate_presence_of(:incorrect_answers)
    end
  end

end