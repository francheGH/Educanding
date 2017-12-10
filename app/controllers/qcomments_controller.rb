class QcommentsController < ApplicationController
  def new
    @qcomments = Qcomment.new
    @q = Question.find(params[:question_id])
    $q = Question.find(params[:question_id])
  end

  def create
    @qcomments = Qcomment.new(qcomment_params)
    @qcomments.user_id = current_user.id
    @qcomments.question_id = $q.id

    if @qcomments.save
      redirect_to $q, notice: "Comentaro realizado"
    else
      render :new
    end
  end

  def destroy

    Qcomment.find(params[:id]).destroy
    redirect_to $q, notice: "Comentario eliminado."
    
  end
  def edit
        @qcomments = Qcomment.find(params[:id])
  end

  def update
    @qcomments = Qcomment.find(params[:id])
    if @qcomments.update(qcomment_params)
      redirect_to @qcomments.question, notice: "Comentario modificado"
    else
      render :edit
    end
  end

  private
  def qcomment_params
    params.require(:qcomment).permit(:texto)
  end
end
