require 'rails_helper'

describe Question, type: :model do
  let(:question)     { create(:question, content: "5+5", answer: "10" ) }
  let(:question_two) { create(:question, content: "What does U.S.A. mean", answer: "United States of America") }
  let(:quiz)         { create(:quiz, questions: [question, question_two]) }
  let(:quiz_two)     { create(:quiz, questions: [question]) }

  context "association", level_two: true, level_three: true do
    it { should have_and_belong_to_many(:quizzes) }
  end

  context "validations", level_one: true, level_two: true, level_three: true do
    it "presence of content" do
      should validate_presence_of(:content)
    end

    it "presence of answer" do
      should validate_presence_of(:answer)
    end
  end

  describe "#check_answer", level_one: true, level_two: true, level_three: true do
    it "is false if the answer is not valid" do
      expect(question.check_answer('100')).to be(false)
    end

    it "is number to number to word insensitive" do
      expect(question.check_answer('10')).to be(true)
    end

    it "is number to word to number insensitive" do
      expect(question.check_answer("TEN")).to be(true)
    end

    it "is case insensitive" do
      expect(question_two.check_answer("united states of america")).to be(true)
    end

    it "is whitespace insensitive" do
      expect(question_two.check_answer("    united states of america     ")).to be(true)
    end
  end
end
