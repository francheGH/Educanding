class QcommentsController < ApplicationController
  def new
  	@qcomments = Qcomment.new
  	@q = Question.find(params[:question_id])
  	$q = Question.find(params[:question_id])
  end

  def create
  	@qcomments = Qcommnet.new(qcomment_params)
    @qcomments.user_id = current_user.id
    @qcomments.question_id = $q.id

    if @qcomments.save
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
  def qcomment_params
    params.require(:qcomment).permit(:texto)
  end
end
