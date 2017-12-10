class AvotesController < ApplicationController
  def new
    @a = Answer.find(params[:answer_id])
    @au = @a.user
    @q = Question.find(@a.question_id)
    
    @vote = Avote.new
    @vote.user_id = current_user.id
    @vote.answer_id = @a.id
    @vote.positivo = params[:positivo]
    
    if @vote.save
      if @vote.positivo == true
        @a.increment!(:positive_votes, 1)
        User.update(@au.id, :puntos => @au.puntos + 10)
      else
        @a.increment!(:negative_votes, 1)
        User.update(@au.id, :puntos => @au.puntos - 2)
      end

      if Avote.exists?(:user_id => current_user.id, :answer_id => @a.id, :positivo => !(@vote.positivo))
        @v = Avote.find_by(:user_id => current_user.id, :answer => @a.id, :positivo => !(@vote.positivo))
        if @v.positivo == true
          @a.decrement!(:positive_votes, 1)
          User.update(@au.id, :puntos => @au.puntos - 12)
        else
          @a.decrement!(:negative_votes, 1)
          User.update(@au.id, :puntos => @au.puntos + 12)
        end
        @v.destroy
      end

      redirect_to @q
    else
      redirect_to @q, alert: "Hubo un error al borrar el voto."
    end
  end

  def destroy
    @a = Answer.find(params[:answer_id])
    @au = @a.user
    @q = Question.find(@a.question_id)
    
    @vote = Avote.where(:user_id => current_user.id, :answer_id => @a.id, :positivo => params[:positivo])
    if @vote.first.positivo == true
      @a.decrement!(:positive_votes, 1)
      User.update(@au.id, :puntos => @au.puntos - 10)
    else
      @a.decrement!(:negative_votes, 1)
      User.update(@au.id, :puntos => @au.puntos + 2)
    end

    if @vote.destroy_all
      redirect_to @q
    else
      redirect_to @q, alert: "Hubo un error al borrar el voto."
    end
  end
end
