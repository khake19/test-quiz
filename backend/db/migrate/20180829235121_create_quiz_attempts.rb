class CreateQuizAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_attempts do |t|
      t.integer :correct_answers
      t.integer :incorrect_answers
      t.references :quiz

      t.timestamps
    end
  end
end
