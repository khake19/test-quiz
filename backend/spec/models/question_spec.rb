require 'rails_helper'

describe Question, type: :model do
  let(:question)     { create(:question, content: "5+5", answer: "10" ) }
  let(:question_two) { create(:question, content: "What does U.S.A. mean", answer: "United States of America") }

  context "validations" do
    it "presence of content" do
      should validate_presence_of(:content)
    end

    it "presence of answer" do
      should validate_presence_of(:answer)
    end
  end

  describe "#check_answer" do
    it "returns false if the answer is incorrect" do
      expect(question.check_answer('100')).to be(false)
    end

    context "answer is number" do
      it "accepts answer as number" do
        expect(question.check_answer('10')).to be(true)
      end

      it "accepts answer as number in words" do
        expect(question.check_answer("TEN")).to be(true)
      end
    end

    context "answer is number in words" do
      let(:another_question) { create(:question, content: "one + one is?", answer: "two") }

      it "accepts answer as number" do
        expect(another_question.check_answer('2')).to be(true)
      end

      it "accepts answer as number in words" do
        expect(another_question.check_answer("TWO")).to be(true)
      end
    end

    it "is case insensitive" do
      expect(question_two.check_answer("united states of america")).to be(true)
    end

    it "is whitespace insensitive" do
      expect(question_two.check_answer("    united states of america     ")).to be(true)
    end
  end
end
