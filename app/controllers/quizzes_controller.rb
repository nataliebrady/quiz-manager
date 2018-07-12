class QuizzesController < ApplicationController
  
  def index
    @quizzes = Quiz.paginate(page: params[:page])   
  end

  def new
    @quiz = Quiz.new
    @quiz.questions.build.answers.build
  end
  
  def show
    @quiz = Quiz.find(params[:id])
  end

  def create 
    @quiz = Quiz.new(show_params)
    if @quiz.save
      flash[:success] = "You have created a new quiz!"
      redirect_to @quiz
    else 
      render 'new'
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end
  
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(show_params)
      flash[:success] = "Quiz updated"
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def destroy
    Quiz.find(params[:id]).destroy
    flash[:success] = "Quiz deleted"
    redirect_to quizzes_url
  end
  
  private
  
  def show_params

    params.require(:quiz).permit(:title, questions_attributes: [:id, :question_title, :quiz_id, :done, :_destroy, answers_attributes: [:id, :answer_title, :question_id, :quiz_id, :correct_answer]])
  end
end
