#- [LVL1-QUIZ]

class Question < ApplicationRecord
  #Associations:
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
