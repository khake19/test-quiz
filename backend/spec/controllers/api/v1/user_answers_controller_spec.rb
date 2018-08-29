require 'rails_helper'

describe Api::V1::UserAnswersController, type: :controller do
  let(:question) { create :question }
  let(:answer) { create :user_answer, question: question }

  describe '#index' do
    it 'correct data' do
      get :index, question_id: question.id, format: :json

      expect(response).to have_http_status(:success)
    end

    it 'question_id is invalid' do
      expect{
        get :index, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#show' do
    it 'not found' do
      expect{
        get :show, question_id: question.id, id: answer.id, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#new' do
    it 'not found' do
      expect{
        get :new, question_id: question.id, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#create' do
    let(:build_data) { create :user_answer, question: question }

    it 'valid data' do
      post :create, question_id: question.id, user_answer: build_data

      expect(UserAnswer.last).to eq(build_data.answer)
    end

    it 'valid data render json' do
      post :create, question_id: question.id, user_answer: build_data

      expect(JSON.parse(response.body)).to eq({message: 'success'})
    end

    it 'invalid data render json' do
      build_data.answer = nil

      post :create, question_id: question.id, user_answer: build_data

      expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { answer: "can't be blank" }})
    end
  end

  describe '#update' do
    it 'not found' do
      expect{
        put :update, question_id: question.id, id: answer.id, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#destroy' do
    it 'not found' do
      expect{
        delete :destroy, question_id: question.id, id: answer.id, format: :json
      }.to raise_error(ActionController::RoutingError)
    end
  end
end
