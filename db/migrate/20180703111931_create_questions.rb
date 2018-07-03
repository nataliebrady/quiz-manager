class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question_title
      t.references :quiz, foreign_key: true, index: true

      t.timestamps
    end
  end
end
