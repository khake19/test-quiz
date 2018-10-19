#- [LVL2-QUIZ]
class Quiz < ApplicationRecord
  #Associations:
  #- add association for quiz_attempts
  #- add association for questions

  #Validations:
  #- name and description must be present

  def overall_results;
    # get all the QuizAttempts for a quiz
    # and return a hash with the number of times it has been answered,
    # the average of correct answers and
    # the average of incorrect answers
    { answered_times: nil, correct_avg: nil, incorrect_avg: nil }
  end
end
