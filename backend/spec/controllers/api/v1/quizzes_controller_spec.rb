require 'rails_helper'

describe Api::V1::QuizzesController, type: :controller do
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
      get :show, id: quiz.id, format: :json

      expect(response.body).to include(quiz_data.to_json)
    end

    it 'include question data' do
      get :show, id: quiz.id, format: :json

      expect(response.body).to eq(question_data.to_json)
    end

    it 'id is not exist' do
      expect{
        get :show, id: 123456787899, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#new' do
    it 'no method new' do
      expect{
        get :new, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#create' do
    let(:build_param) { build :quiz }

    it 'able to create quiz' do
      post :create, quiz: build_param.to_json, format: :json

      expect(Quiz.last.name).to eq(build_param.name)
    end

    it 'render json' do
      post :create, question: build_param.to_json, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'success'})
    end

    it 'invalid name should return error message' do
      build_param.name = nil

      post :create, question: build_param.to_json, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { name: "can't be blank" }})
    end

    it 'invalid description should return error message' do
      build_param.description = nil

      post :create, question: build_param.to_json, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { description: "can't be blank" }})
    end

    it 'strong attributes' do
      should permit(:name, :description).
        for(:create)
    end
  end

  describe '#update' do
    let(:quote) { Faker::Matz.quote }

    it 'can update' do
      put :update, id: quiz.id, quiz: { name: quote }, format: :json

      quiz.reload
      expect(quiz.name).to eq(quote)
    end

    it 'render json if data is created' do
      put :update, id: quiz.id, quiz: { name: quote }, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'success'})
    end

    it 'invalid name should return error message' do
      put :update, id: quiz.id, quiz: { name: '' }, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { name: "can't be blank" }})
    end

    it 'invalid description return error message' do
      put :update, id: quiz.id, quiz: { description: '' }, format: :json

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { description: "can't be blank" }})
    end

    it 'strong attributes' do
      should permit(:name, :description).
        for(:update)
    end
  end

  describe '#destroy' do
    it 'valid id can destroy data' do
      delete :destroy, id: quiz.id, format: :json

      expect(Quiz.find(quiz.id)).to be_nil
    end

    it 'valid id render json message' do
      delete :destroy, id: quiz.id, format: :json

      expect(JSON.parse{response.body}).to eq({status: 'success', id: quiz.id})
    end

    it 'invalid id' do
      expect{
        delete :destroy, format: :json
      }.to raise_error(ActionController::RoutingError)
    end

    it 'invalid id not render json message' do
      delete :destroy, id: '1234', format: :json

      expect(JSON.parse{response.body}).to eq({})
    end
  end
end
