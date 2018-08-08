class AnsweredQuestionsController < ApplicationController

  def index
    @answered_questions = AnsweredQuestion.paginate(page: params[:page])   
  end
  
  def show
    @answered_question = AnsweredQuestion.new
  end

  def create
    @answered_question = current_user.answered_questions.build(answered_params)
    if @answered_question.save
      flash[:success] = "You have completed the quiz!"
      redirect_to results_quiz_path(params[:id])
    else
      render ''
    end
  end

  def edit
    @answered_questions = AnsweredQuestion.find(params[:id])
  end


  def destroy
    AnsweredQuestion.find(params[:id]).destroy
    flash[:success] = "Answered quiz deleted"
    redirect_to answered_questions_url
  end
  
  private
  
  def answered_params()
    params.require(:answered_questions).permit(:question_id, :quiz_id, :user_id, answer_ids: [])
  end

end

