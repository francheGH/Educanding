class QuestionsController < ApplicationController
  def index
    if params[:tag]
      @questions.tagged_with(params[:tag])
    else
      @questions.all
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.update_attribute(:visitas, @question.visitas + 1)
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

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: "Pregunta modificada."
    else
      render :edit
    end
  end
  
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    
    if @question.save
      redirect_to @question, notice: "Pregunta realizada."
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:faculty_id, :pregunta, :detalles, :tag_list)
  end
end
