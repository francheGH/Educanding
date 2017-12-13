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
      redirect_to $q, notice: "Respuesta realizada."
      $q.update_attribute(:cant_respuestas, $q.cant_respuestas + 1)
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

    @answer = Answer.find(params[:id]).destroy
    redirect_to $q, notice: "Respuesta eliminada"

  end

  def better
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(@answer.question_id)
    if (@question.tieneMejorRespuesta)
      if (@answer.mejorRespuesta)
        @answer.update_attribute(:mejorRespuesta, false)
        @question.update_attribute(:tieneMejorRespuesta, false)
        redirect_to @answer.question, notice: "Eliminada como mejor respuesta."
      else
        redirect_to @answer.question, notice: "Ya hay una mejor respuesta elegida."
      end
    else
      @answer.update_attribute(:mejorRespuesta, true)
      @question.update_attribute(:tieneMejorRespuesta, true)
      redirect_to @answer.question, notice: "Mejor respuesta elejida."
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:respuesta)
  end
end
