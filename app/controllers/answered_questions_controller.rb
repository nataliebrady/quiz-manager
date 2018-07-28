class AnsweredQuestionsController < ApplicationController

  def index
    @answered_questions = AnsweredQuestion.paginate(page: params[:page])   
  end
  
  def show
    @answered_questions = AnsweredQuestion.find(params[:id])
    @answered_question = AnsweredQuestion.all
  end

  def create 
    @answered_questions = current_user.answered_questions.create(answered_params)
    if @answered_questions.save
      flash[:success] = "You have completed the quiz!"
      redirect_to @answered_questions
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
  
  def answered_params
    params.permit(:answered_question).permit(:question_id, :answer_id, :user_id, :question_title, :answer_title, :name)
  end

end
