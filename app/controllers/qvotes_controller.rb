class QvotesController < ApplicationController
  def new
    @q = Question.find(params[:question_id])
    @qu = @q.user

    @vote = Qvote.new
    @vote.user_id = current_user.id
    @vote.question_id = @q.id
    @vote.positivo = params[:positivo]
    
    if @vote.save
      if @vote.positivo == true
        @q.increment!(:positive_votes, 1)
        User.update(@qu.id, :puntos => @qu.puntos + 5)
      else
        @q.increment!(:negative_votes, 1)
        User.update(@qu.id, :puntos => @qu.puntos - 2)
      end

      if Qvote.exists?(:user_id => current_user.id, :question_id => @q.id, :positivo => !(@vote.positivo))
        @v = Qvote.find_by(:user_id => current_user.id, :question_id => @q.id, :positivo => !(@vote.positivo))
        if @v.positivo == true
          @q.decrement!(:positive_votes, 1)
          User.update(@qu.id, :puntos => @qu.puntos - 7)
        else
          @q.decrement!(:negative_votes, 1)
          User.update(@qu.id, :puntos => @qu.puntos + 7)
        end
        @v.destroy
      end

      redirect_to @q
    else
      redirect_to @q, alert: "Hubo un error al borrar el voto."
    end
  end

  def destroy
    @q = Question.find(params[:question_id])
    @qu = @q.user
    
    @vote = Qvote.where(:user_id => current_user.id, :question_id => @q.id, :positivo => params[:positivo])
    if @vote.first.positivo == true
      @q.decrement!(:positive_votes, 1)
      User.update(@qu.id, :puntos => @qu.puntos - 5)
    else
      @q.decrement!(:negative_votes, 1)
      User.update(@qu.id, :puntos => @qu.puntos + 2)
    end

    if @vote.destroy_all
      redirect_to @q
    else
      redirect_to @q, alert: "Hubo un error al borrar el voto."
    end
  end
end
