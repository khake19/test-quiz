require 'rails_helper'

describe Api::V1::QuizAttemptsController, type: :controller, :"level-three" => true do
  describe '#index' do
    let(:quiz) { create :quiz }
    let(:attempts) { create_list :quiz_attempt, 3, quiz: quiz }

    it 'route not found if question id blank' do
      expect{
        get :index, format: :json
      }.to raise_error(ActionController::RoutingError)
    end

    it 'returns a JSON with correct data' do
      get :index, quiz_id: quiz.id, format: :json

      expect(JSON.parse(response.body)).to eq(attempts)
    end
  end
end
