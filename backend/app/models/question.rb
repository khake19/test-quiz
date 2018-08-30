class Question < ApplicationRecord
  #Associations:
  has_many :user_answers
  #- add association for quizzes

  #Validations:
  #- content and answer must be present

  #--
  def check_answer(answer)
    # given an answer
    # please validate that
    #  - the response is correct
    #  - the response must be case and whitespace insensitive
    #  - the response must be number to word insensitive
  end

end
