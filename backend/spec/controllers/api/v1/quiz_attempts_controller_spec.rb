require 'rails_helper'

describe Api::V1::QuizAttemptsController, type: :controller do
  describe '#index' do
    let(:question) { create :question }
    let(:attempts) { create_list :quiz_attempt, 3, question: question }

    it 'if question id blank' do
      expect{
        get :index, format: :json
      }.to raise_error(ActionController::RoutingError)
    end

    it 'correct data' do
      get :index, question_id: question.id, format: :json

      expect(JSON.parse(response.body)).to eq(attempts)
    end
  end
end
