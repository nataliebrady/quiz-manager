class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :answer_title
      t.references :question, foreign_key: true
      t.references :quiz, foreign_key: true
      t.boolean :correct_answer, default: false

      t.timestamps
    end
  end
end
