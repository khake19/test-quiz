class UserAnswer < ApplicationRecord
  belongs_to :question

  validates_presence_of :answer
end
