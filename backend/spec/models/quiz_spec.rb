require 'rails_helper'

describe Quiz, type: :model do
  let(:question)   { Question.new(content: "5+5", answer: "10" ) }
  let(:quiz) { Quiz.new(questions: question) }

  context "association" do
    it "has_and_belongs_to_many Questions" do
      (Question.reflect_on_association(:questions).macro).to eq(:has_and_belongs_to_many)
    end

    it "has_many QuizAttemts" do
      (Quiz.reflect_on_association(:quiz_attempts).macro).to eq(:has_many)
    end
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
    it "returns a hash" do
      expect(quizz.overall_results).to be_a(Hash)
    end

    it "lists the number of correct and incorrect attempts for each question" do
      expect(quizz.overall_results.keys).to include("answered_times")
      expect(quizz.overall_results.keys).to include("correct_avg")
      expect(quizz.overall_results.keys).to include("incorrect_avg")
      expect(quizz.overall_results.values.any?(nil)).to be_false
    end
  end

end