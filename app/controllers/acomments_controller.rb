class AcommentsController < ApplicationController
  def new
  	@acomments = Acomment.new
    @a = Answer.find(params[:answer_id])
    $q = Question.find(params[:question_id])
    $a = Answer.find(params[:answer_id])
  end

  def create
  	@acomments = Acommnet.new(acomment_params)
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
  end

  def edit
  end

  private
  def acomment_params
    params.require(:acomment).permit(:texto)
  end
end
