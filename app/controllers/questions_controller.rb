class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])    
  end

  def new
    @question = Question.new    
  end

  def edit
    redirect_to questions_path    
  end

  def destroy
    redirect_to questions_path    
  end

  def new 
    @question = Question.new
  end

  def update
    
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:pregunta, :detalles, :user_id))
    @question.user_id = current_user.id
    @question.save
    redirect_to @question, notice: "Pregunta realizada."
  end
end
