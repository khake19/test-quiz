class Quiz < ApplicationRecord
  #Associations
  #add association for quiz_attempts
  #add association for questions

  #Validations
  validates_presence_of :name
  validates_presence_of :description

  # should it sort questions?
  #

  def overall_results; end
end