class QuizzesController < ApplicationController
  
  def new
    @quiz = Quiz.new
    @quiz.questions.build.answers.build
  end
  
  def show
    @quiz = Quiz.find(params[:id])
  end
  
  private
  
  def show_params
    params.require(:quiz).permit(:title, 
      :questions_attributes => [:question_title, :quiz_id,
        :answers_attributes => [:answer_title, :question_id, :quiz_id, :correct_answer]
      ]
    )
  end
end
