class Question < ApplicationRecord
  has_many :user_answers

  validates_presence_of :name
  validates_presence_of :answer
end
