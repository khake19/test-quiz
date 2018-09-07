class CreateQuizQuestionJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :quizzes, :questions do |t|
      # t.index [:quiz_id, :question_id]
      # t.index [:question_id, :quiz_id]
    end
  end
end
