require 'rails_helper'

describe QuestionsController, type: :controller do
  let(:question) { create :question }

  describe '#index' do
    before(:each) do
      create_list :question, 3
    end

    it 'returns a JSON with correct data' do
      get :index, format: :json

      expect(JSON.parse(response.body).count).to eq(3)
    end
  end

  describe '#show' do
    context 'when id is valid' do
      it 'responds with a success HTTP status' do
        get :show, params: { id: question.id }, format: :json

        expect(response).to have_http_status(:ok)
      end

      it 'returns a JSON with correct data' do
        get :show, params: { id: question.id }, format: :json
        expect(JSON.parse(response.body)).to include('id' => question.id,
                                                      'content' => question.content,
                                                      'answer' => question.answer)
      end
    end

    context 'when id is invalid' do
      it 'returns with HTTP status not found' do
        get :show, params: { id: 123456787899 }, format: :json

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#answer' do
    context 'given correct answer' do
      it 'returns JSON with success message' do
        post :answer, params: { id: question.id, question: { answer: question.answer } }, format: :json

        expect(JSON.parse(response.body)).to include({ 'correct' => true })
        expect(response).to have_http_status(:ok)
      end
    end

    context 'given incorrect answer' do
      it 'returns JSON with success message' do
        post :answer, params: { id: question.id, question: { answer: 'sdasd' } }, format: :json

        expect(JSON.parse(response.body)).to include({ 'correct' => false })
        expect(response).to have_http_status(:ok)
      end
    end

    context 'given blank answer' do
      it 'render JSON with error message' do
        post :answer, params: { id: question.id, question: { answer: '' } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
