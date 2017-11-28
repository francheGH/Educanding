class AvotesController < ApplicationController
  def new
    @a = Answer.find(params[:answer_id])
    @q = Question.find(@a.question_id)    
    @u = User.find(params[:user_id])
    @vote = Avote.new
    @vote.user_id = current_user.id
    @vote.answer_id = @a.id
    @vote.positivo = params[:positivo]
    
    if @vote.save
      if @vote.positivo == true
        @a.increment!(:positive_votes, 1)
        User.update(params[:user_id], :puntos => @u.puntos + 10)
      else
        @a.increment!(:negative_votes, 1)
        User.update(params[:user_id], :puntos => @u.puntos - 2)
      end
      redirect_to @q, notice: "Respuesta votada."
    else
      redirect_to @q, notice: "Hubo un error al borrar el voto."
    end
  end

  def destroy
    @a = Answer.find(params[:answer_id])
    @q = Question.find(@a.question_id)
    @u = User.find(params[:user_id])
    @vote = Avote.where(:user_id => current_user.id, :answer_id => @a.id, :positivo => params[:positivo])
    if @vote.first.positivo == true
      @a.decrement!(:positive_votes, 1)
      User.update(params[:user_id], :puntos => @u.puntos - 10)
    else
      @a.decrement!(:negative_votes, 1)
      User.update(params[:user_id], :puntos => @u.puntos + 2)
    end

    if @vote.destroy_all
      redirect_to @q, notice: "Se quito el voto."
    else
      redirect_to @q, notice: "Hubo un error al borrar el voto."
    end
  end
end
