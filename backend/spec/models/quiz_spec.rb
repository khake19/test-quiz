require 'rails_helper'

describe Quiz, type: :model do
  let(:question)   { create(:question, content: "5+5", answer: "10" ) }
  let(:quiz)       { create(:quiz, questions: question) }

  context "association" do
    it { should have_many(:quiz_attempts) }
    it { should have_and_belong_to_many(:quizzes) }
  end

  context 'validations' do
    it "presence of content" do
      should validate_presence_of(:name)
    end

    it "presence of description" do
      should validate_presence_of(:description)
    end

    it "presence of questions" do
      should validate_presence_of(:questions)
    end
  end

  context "overall_results" do
    let(:first_quiz_attempt) { create(:quiz_attempt, quiz_id: quiz.id, correct_answers: 10, incorrect_answers: 0) }
    let(:second_quiz_attempt) { create(:quiz_attempt, quiz_id: quiz.id, correct_answers: 0, incorrect_answers: 10) }

    it "returns a hash" do
      expect(quiz.overall_results).to be_a(Hash)
    end

    it "lists the number of correct and incorrect attempts for each question" do
      expect(quiz.overall_results[:answered_times]).to eq(2)
      expect(quiz.overall_results[:correct_avg]).to eq(5)
      expect(quiz.overall_results[:incorrect_avg]).to eq(5)
      expect(quiz.overall_results.values.any?(nil)).to be_false
    end
  end

end