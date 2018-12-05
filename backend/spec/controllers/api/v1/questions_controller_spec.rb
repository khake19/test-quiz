require 'rails_helper'

describe Api::V1::QuestionsController, type: :controller, level_one: true, level_two: true, level_three: true do
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

  describe '#create' do
    let(:build_param) { build :question }

    context 'with valid data' do
      it 'adds question record' do
        post :create, params: { question: build_param.as_json }, format: :json
        expect(Question.last.content).to eq(build_param.content)
      end

      it 'returns success message in JSON format' do
        post :create, params: { question: build_param.as_json }, format: :json

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid data' do
      it 'returns error message in JSON format' do
        build_param.content = nil

        post :create, params: { question: build_param.as_json }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#update' do
    let!(:question) { create :question, content: 'What is the number after 1?' }
    let(:quote) { Faker::Matz.quote }

    context 'with valid data' do
      it 'updates question data' do
        expect {
          put :update, params: { id: question.id, question: { content: quote } }, format: :json
        }.to change{ question.reload.content }.from('What is the number after 1?').to(quote)
      end

      it 'returns success message in JSON format' do
        put :update, params: { id: question.id, question: { content: quote } }, format: :json

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid data' do
      it 'renders error message in JSON format' do
        put :update, params: { id: question.id, question: { content: nil } }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    let!(:question) { create :question }

    context 'with valid id' do
      it 'destroys question' do
        expect {
          delete :destroy, params: { id: question.id }, format: :json
        }.to change{ Question.count }.by(-1)
      end

      it 'returns success message and deleted id in JSON format' do
        delete :destroy, params: { id: question.id }, format: :json

        expect(JSON.parse(response.body)).to include('id' => question.id)
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid id' do
      it 'returns HTTP status not found' do
        delete :destroy, params: { id: '1234' }, format: :json

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
