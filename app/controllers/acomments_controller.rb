class AcommentsController < ApplicationController
  def new
    @acomments = Acomment.new
    @a = Answer.find(params[:answer_id])
    $q = Question.find(params[:question_id])
    $a = Answer.find(params[:answer_id])
  end

  def create
    @acomments = Acomment.new(acomment_params)
    @acomments.user_id = current_user.id
    @acomments.question_id = $q.id
    @acomments.answer_id = $a.id

    if @acomments.save
      redirect_to $q, notice: "Comentaro realizado"
    else
      render :new
    end
  end

  def destroy


    Acomment.find(params[:id]).destroy
    redirect_to $q, notice: "Comentario eliminado."
    

  end

  def edit
    @acomments = Acomment.find(params[:id])
  end

  def update
    @acomments = Acomment.find(params[:id])
    if @acomments.update(acomment_params)
      redirect_to @acomments.question, notice: "Comentario modificado"
    else
      render :edit
    end
  end

  private
  def acomment_params
    params.require(:acomment).permit(:texto)
  end
end
