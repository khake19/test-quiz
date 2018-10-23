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
    it 'responds with a success HTTP status' do
      get :show, params: { id: question.id }, format: :json

      expect(response).to have_http_status(:success)
    end

    it 'returns a JSON with correct data' do
      get :show, params: { id: question.id }, format: :json

      expect(JSON.parse(response.body)).to include('id' => question.id,
                                                    'content' => question.content,
                                                    'answer' => question.answer)
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

    it 'able to create data' do
      post :create, params: { question: build_param.to_json }, format: :json

      expect(Question.last.content).to eq(build_param.content)
    end

    context 'with valid data' do
      it 'returns success message in JSON format' do
        post :create, params: { question: build_param.to_json }, format: :json

        expect(JSON.parse(response.body)).to eq({message: 'success'})
      end
    end

    context 'with invalid data' do
      it 'returns error message in JSON format' do
        build_param.content = nil

        post :create, params: { question: build_param.to_json }, format: :json

        expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { content: "can't be blank" }})
      end
    end
  end

  describe '#update' do
    let(:quote) { Faker::Matz.quote }

    it 'able to update data' do
      put :update, params: { id: question.id, question: { content: quote } }, format: :json

      question.reload
      expect(question.content).to eq(quote)
    end

    context 'with valid data' do
      it 'returns success message in JSON format' do
        put :update, params: { id: question.id, question: { content: quote } }, format: :json

        expect(JSON.parse(response.body)).to eq({message: 'success'})
      end
    end

    context 'with invalid data' do
      it 'invalid data render json message' do
        put :update, params: { id: question.id, question: { content: nil } }, format: :json

        expect(JSON.parse(response.body)).to eq({message: 'failed', errors: { content: "can't be blank" }})
      end
    end
  end

  describe '#destroy' do
    it 'able to destroy data if id valid' do
      delete :destroy, params: { id: question.id }, format: :json

      expect(Question.find(question.id)).to be_nil
    end

    context 'with valid id' do
      it 'returns success message and deleted id in JSON format' do
        delete :destroy, params: { id: question.id }, format: :json

        expect(JSON.parse(response.body)).to eq({status: 'success', id: question.id})
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

        expect(JSON.parse(response.body)).to eq({ status: 'success', correct: true })
      end
    end

    context 'given incorrect answer' do
      it 'returns JSON with success message' do
        post :answer, params: { id: question.id, question: { answer: 'sdasd' } }, format: :json

        expect(JSON.parse(response.body)).to eq({ status: 'success', correct: false })
      end
    end

    context 'given blank answer' do
      it 'render JSON with error message' do
        post :answer, params: { id: question.id, question: { answer: '' } }, format: :json

        expect(JSON.parse(response.body)).to eq({ message: 'failed', errors: { content: "can't be blank" } })
      end
    end
  end
end
