require 'rails_helper'

describe UserAnswer, type: :model do
  context 'validations' do
    it 'presence of answer' do
      should validate_presence_of(:answer)
    end
  end
end
