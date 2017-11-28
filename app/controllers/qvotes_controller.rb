class QvotesController < ApplicationController
  def new
    @q = Question.find(params[:question_id])
    @u = User.find(params[:user_id])
    @vote = Qvote.new
    @vote.user_id = current_user.id
    @vote.question_id = @q.id
    @vote.positivo = params[:positivo]
    
    if @vote.save
      if @vote.positivo == true
        @q.increment!(:positive_votes, 1)
        User.update(params[:user_id], :puntos => @u.puntos + 5)
      else
        @q.increment!(:negative_votes, 1)
        User.update(params[:user_id], :puntos => @u.puntos - 2)
      end
      redirect_to @q, notice: "Pregunta votada."
    else
      redirect_to @q, notice: "Hubo un error al borrar el voto."
    end
  end

  def destroy
    @q = Question.find(params[:question_id])
    @u = User.find(params[:user_id])
    @vote = Qvote.where(:user_id => current_user.id, :question_id => @q.id, :positivo => params[:positivo])
    if @vote.first.positivo == true
      @q.decrement!(:positive_votes, 1)
      User.update(params[:user_id], :puntos => @u.puntos - 5)
    else
      @q.decrement!(:negative_votes, 1)
      User.update(params[:user_id], :puntos => @u.puntos + 2)
    end

    if @vote.destroy_all
      redirect_to @q, notice: "Se quito el voto."
    else
      redirect_to @q, notice: "Hubo un error al borrar el voto."
    end
  end
end
