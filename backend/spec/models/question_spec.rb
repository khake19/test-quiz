require 'rails_helper'

describe Question, type: :model do
  context 'validations' do
    it 'presence of name' do
      should validate_presence_of(:name)
    end

    it 'presence of answer' do
      should validate_presence_of(:answer)
    end
  end
end
