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
    end
  end

  describe '#show' do
    let(:question) { create :question }

    let(:quiz_data) {{ quiz: quiz }}
    let(:question_data) {{ questions: [question] }}

    it 'include quiz data' do
      get :show, params: { id: quiz.id }, format: :json

      expect(JSON.parse(response.body)).to include(quiz_data.as_json)
    end

    it 'include question data' do
      get :show, params: { id: quiz.id }, format: :json

      expect(JSON.parse(response.body)).to include(question_data.as_json)
    end

    it 'id is not exist' do
      get :show, params: { id: 123456787899 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#create' do
    let(:build_param) { build :quiz }

    it 'able to create quiz' do
      post :create, params: { quiz: build_param.to_json }, format: :json

      expect(Quiz.last.name).to eq(build_param.name)
    end

    it 'render json' do
      post :create, params: { question: build_param.to_json }, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'success'})
    end

    it 'invalid name should return error message' do
      build_param.name = nil

      post :create, params: { question: build_param.to_json }, format: :json

      expect(JSON.parse(response.body)).to eq({ message: 'failed', errors: { name: "can't be blank" } })
    end

    it 'invalid description should return error message' do
      build_param.description = nil

      post :create, params: { question: build_param.to_json }, format: :json

      expect(JSON.parse(response.body)).to eq({ message: 'failed', errors: { description: "can't be blank" } })
    end
  end

  describe '#update' do
    let(:quote) { Faker::Matz.quote }

    it 'can update' do
      put :update, params: { id: quiz.id, quiz: { name: quote } }, format: :json

      quiz.reload
      expect(quiz.name).to eq(quote)
    end

    it 'render json if data is created' do
      put :update, params: { id: quiz.id, quiz: { name: quote } }, format: :json

      expect(JSON.parse(response.body)).to eq({ message: 'success' })
    end

    it 'invalid name should return error message' do
      put :update, params: { id: quiz.id, quiz: { name: '' } }, format: :json

      expect(JSON.parse(response.body)).to eq({ message: 'failed', errors: { name: "can't be blank" } })
    end

    it 'invalid description return error message' do
      put :update, params: { id: quiz.id, quiz: { description: '' } }, format: :json

      expect(JSON.parse(response.body)).to eq({ message: 'failed', errors: { description: "can't be blank" } })
    end
  end

  describe '#destroy' do
    it 'valid id can destroy data' do
      delete :destroy, params: { id: quiz.id }, format: :json

      expect(Quiz.find(quiz.id)).to be_nil
    end

    it 'valid id render json message' do
      delete :destroy, params: { id: quiz.id }, format: :json

      expect(JSON.parse{response.body}).to eq({ status: 'success', id: quiz.id })
    end

    it 'invalid id returns HTTP status not found' do
      delete :destroy, params: { id: '1234' }, format: :json

      expect(response).to have_http_status(:not_found)
    end
  end
end
