class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @q = Question.find(params[:question_id])
    $q = Question.find(params[:question_id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = $q.id

    if @answer.save
      redirect_to $q, notice: "Pregunta realizada."
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to @answer.question, notice: "Respuesta modificada."
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:respuesta)
  end
end
