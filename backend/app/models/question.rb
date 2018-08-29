class Question < ApplicationRecord
  #Associations
  has_many :user_answers
  #add association for quizzes

  #Validations
  validates_presence_of :content
  validates_presence_of :answer

  #--
  def check_answer(answer)
    # given an answer
    # please validate the response is correct
    # response must be case, whitespace and number to word insensitive
  end

end
