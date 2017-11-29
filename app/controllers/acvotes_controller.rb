class AcvotesController < ApplicationController
  def new
    @c = Acomment.find(params[:acomment_id])
    @q = Question.find(@c.question_id)
    @u = User.find(params[:user_id])
    @vote = Acvote.new
    @vote.user_id = current_user.id
    @vote.acomment_id = @c.id
    @vote.positivo = params[:positivo]
    
    if @vote.save
      if @vote.positivo == true
        @c.increment!(:positive_votes, 1)
        User.update(params[:user_id], :puntos => @u.puntos + 5)
      else
        @c.increment!(:negative_votes, 1)
        User.update(params[:user_id], :puntos => @u.puntos - 2)
      end
      redirect_to @q, notice: "Comentario votado."
    else
      redirect_to @q, notice: "Hubo un error al borrar el voto."
    end
  end

  def destroy
    @c = Acomment.find(params[:acomment_id])
    @q = Question.find(@c.question_id)
    @u = User.find(params[:user_id])
    @vote = Acvote.where(:user_id => current_user.id, :acomment_id => @c.id, :positivo => params[:positivo])
    if @vote.first.positivo == true
      @c.decrement!(:positive_votes, 1)
      User.update(params[:user_id], :puntos => @u.puntos - 5)
    else
      @c.decrement!(:negative_votes, 1)
      User.update(params[:user_id], :puntos => @u.puntos + 2)
    end

    if @vote.destroy_all
      redirect_to @q, notice: "Se quito el voto."
    else
      redirect_to @q, notice: "Hubo un error al borrar el voto."
    end
  end
end
