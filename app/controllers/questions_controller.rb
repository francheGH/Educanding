class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
    #if session[:question_id]!= @question.user_id
    # flash[:notice] = "Debe inciar sesion para editar"
    #  redirect_to questions_path
  end

  def delete
  end

  def new 
    @question=Question.new
  end

  def create
    question = Question.create(params.require(:question))
    redirect_to question, notice: "Publicacion realizada"
  end
end
