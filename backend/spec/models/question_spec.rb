require 'rails_helper'

describe Question, type: :model do
  let(:question)     { create(:question, content: "5+5", answer: "10" ) }
  let(:question_two) { create(:question, content: "What does U.S.A. mean", answer: "United States of America") }
  let(:quiz)         { create(:quiz, questions: [question, question_two]) }
  let(:quiz_two)     { create(:quiz, questions: [question]) }

  context "association" do
    describe "Quizzes" do
      it "has_and_belongs_to_many " do
        expect(Question.reflect_on_association(:quizzes).macro).to eq(:has_and_belongs_to_many)
      end
    end
  end

  context "validations" do
    it "presence of content" do
      should validate_presence_of(:content)
    end

    it "presence of answer" do
      should validate_presence_of(:answer)
    end
  end

  describe "#check_answer" do
    it "is false if the answer is not valid" do
      expect(question.check_answer(100)).to be(false)
    end

    it "is number to number to word insensitive" do
      expect(question.check_answer(10)).to be(true)
    end

    it "is number to word to number insensitive" do
      expect(question.check_answer("TEN")).to be(true)
    end

    it "is case insensitive" do
      expect(question_two.check_answer("united states of america")).to be(true)
    end

    it "is whitespace insensitive" do
      expect(question_two.check_answer("united states of     america")).to be(true)
    end
  end
end
