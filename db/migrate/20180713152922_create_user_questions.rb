class CreateUserQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_questions do |t|
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
