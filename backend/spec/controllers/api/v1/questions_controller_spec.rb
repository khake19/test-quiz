require 'rails_helper'

describe Api::V1::QuestionsController, type: :controller do
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
    it 'http success correct data' do
      get :show, id: question.id, format: :json

      expect(response).to have_http_status(:success)
    end

    it 'returns a JSON with correct data' do
      get :show, id: question.id, format: :json

      expect(response.body).to eq(question.to_json)
    end

    it 'not found if id is invalid' do
      expect{
        get :show, id: 123456787899, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#new' do
    it 'not found for new method' do
      expect{
        get :new, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#create' do
    let(:build_param) { build :question }

    it 'able to create data' do
      post :create, question: build_param.to_json, format: :json

      expect(Question.last.content).to eq(build_param.content)
    end

    it 'valid data render json message' do
      post :create, question: build_param.to_json

      expect(JSON.parse(response.body)).to eq({message: 'success'})
    end

    it 'invalid content render json' do
      build_param.content = nil

      post :create, question: build_param.to_json, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { content: "can't be blank" }})
    end

    it 'strong attributes' do
      should permit(:content, :answer).
        for(:create)
    end
  end

  describe '#update' do
    let(:quote) { Faker::Matz.quote }

    it 'able to update data' do
      put :update, id: question.id, question: { content: quote }, format: :json

      question.reload
      expect(question.content).to eq(quote)
    end

    it 'valid data render json message' do
      put :update, id: question.id, question: { content: quote }, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'success'})
    end

    it 'invalid data render json message' do
      put :update, id: question.id, question: { content: nil }, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { content: "can't be blank" }})
    end

    it 'strong attributes' do
      should permit(:content, :answer).
        for(:update)
    end
  end

  describe '#destroy' do
    it 'able to destroy data if id valid' do
      delete :destroy, id: question.id, format: :json

      expect(Question.find(question.id)).to be_nil
    end

    it 'valid id render json message' do
      delete :destroy, id: question.id, format: :json

      expect(JSON.parse{response.body}).to eq({status: 'success', id: question.id})
    end

    it 'route error if invalid id' do
      expect{
        delete :destroy, format: :json
      }.to raise_error(ActionController::RoutingError)
    end

    it 'invalid id not render json message' do
      delete :destroy, id: '1234', format: :json

      expect(JSON.parse{response.body}).to eq({})
    end
  end

  describe '#answer' do
    it 'can answer with correct answer' do
      post :answer, id: question.id, question: { answer: question.answer }, format: :json

      expect(JSON.parse{response.body}).to eq({status: 'success'})
    end

    it 'can answer with incorrect answer' do
      post :answer, id: question.id, question: { answer: 'sdasd' }, format: :json

      expect(JSON.parse{response.body}).to eq({status: 'success'})
    end

    it 'render error message if nil answer' do
      post :answer, id: question.id, question: { answer: '' }, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { content: "can't be blank" }})
    end
  end
end
