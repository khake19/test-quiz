class QuizAttempt < ApplicationRecord
  validates_presence_of :correct_answers
  validates_presence_of :incorrect_answers

  #add association for quizz

end