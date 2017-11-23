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
    @question = Question.find(params[:id])
  end

  def destroy
    redirect_to questions_path
  end

  def new 
    @question = Question.new
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(params.require(:question).permit(:faculty_id, :pregunta, :detalles))
      redirect_to @question, notice: "Pregunta modificada."
    else
      render :edit
    end
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:faculty_id, :pregunta, :detalles))
    @question.user_id = current_user.id
    
    if @question.save
      redirect_to @question, notice: "Pregunta realizada."
    else
      render :new
    end
  end
end
