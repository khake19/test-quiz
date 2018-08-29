class CreateUserAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answers do |t|
      t.string :answer
      t.boolean :status
      t.references :question

      t.timestamps
    end
  end
end
