require 'rails_helper'

describe Api::V1::QuizzesController, type: :controller, level_two: true, level_three: true do
  let(:quiz) { create :quiz }

  describe '#index' do
    before(:each) do
      create_list :quiz, 3
    end

    it 'render correct number of data' do
      get :index, format: :json

      expect(JSON.parse(response.body).count).to eq(3)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:question) { quiz.questions.first }

    context 'with valid quiz id' do
      it 'include quiz data' do
        get :show, params: { id: quiz.id }, format: :json

        expect(JSON.parse(response.body))
          .to include('quiz' => hash_including('description' => quiz.description, 'name' => quiz.name))

        expect(response).to have_http_status(:ok)
      end

      it 'include question data' do
        get :show, params: { id: quiz.id }, format: :json

        expect(JSON.parse(response.body))
          .to include('questions' => JSON.parse(quiz.questions.to_json))
      end
    end

    context 'with invalid quiz id' do
      it 'returns http status not found' do
        get :show, params: { id: 123456787899 }, format: :json
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#create' do
    let(:build_param) { build :quiz, questions: [build(:question)] }

    it 'able to create quiz' do
      post :create, params: { quiz: build_param.as_json }, format: :json

      expect(response).to have_http_status(:created)
    end

    it 'render json' do
      post :create, params: { quiz: build_param.as_json }, format: :json

      expect(JSON.parse(response.body)).to eq({ 'message' => 'success' })
    end

    it 'invalid name should return error message' do
      build_param.name = nil

      post :create, params: { quiz: build_param.as_json }, format: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'invalid description should return error message' do
      build_param.description = nil

      post :create, params: { quiz: build_param.as_json }, format: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#update' do
    let(:quote) { Faker::Matz.quote }

    it 'can update' do
      put :update, params: { id: quiz.id, quiz: { name: quote } }, format: :json

      quiz.reload
      expect(quiz.name).to eq(quote)
    end

    it 'render json if data is updated' do
      put :update, params: { id: quiz.id, quiz: { name: quote } }, format: :json

      expect(response).to have_http_status(:ok)
    end

    it 'invalid name should return error message' do
      put :update, params: { id: quiz.id, quiz: { name: '' } }, format: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'invalid description return error message' do
      put :update, params: { id: quiz.id, quiz: { description: '' } }, format: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#destroy' do
    let!(:quiz_x) { create :quiz }

    it 'valid id can destroy data' do
      expect { delete :destroy, params: { id: quiz_x.id }, format: :json }
        .to change{ Quiz.count }.by(-1)
    end

    it 'valid id render json message' do
      delete :destroy, params: { id: quiz_x.id }, format: :json

      expect(response).to have_http_status(:ok)
    end

    it 'invalid id returns HTTP status not found' do
      delete :destroy, params: { id: '1234' }, format: :json

      expect(response).to have_http_status(:not_found)
    end
  end
end
