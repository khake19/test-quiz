require 'rails_helper'

describe Api::V1::QuizAttemptsController, type: :controller, level_three: true do
  describe '#index' do
    let(:quiz) { create :quiz }
    let(:attempts) { create_list :quiz_attempt, 3, quiz: quiz }

    it 'route not found if question id blank' do
      get :index, format: :json
      expect(respone).to have_http_status(:not_found)
    end

    it 'returns a JSON with correct data' do
      get :index, params: { quiz_id: quiz.id }, format: :json

      expect(JSON.parse(response.body)).to eq(attempts)
    end
  end
end
