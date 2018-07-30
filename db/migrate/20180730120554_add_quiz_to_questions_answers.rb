class AddQuizToQuestionsAnswers < ActiveRecord::Migration[5.1]
  def change
   	add_reference :answered_questions, :quiz, foreign_key: true
  end
end
