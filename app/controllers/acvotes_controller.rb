class AcvotesController < ApplicationController
  def new
    @c = Acomment.find(params[:acomment_id])
    @cu = @c.user
    @q = Question.find(@c.question_id)
    
    @vote = Acvote.new
    @vote.user_id = current_user.id
    @vote.acomment_id = @c.id
    @vote.positivo = params[:positivo]
    
    if @vote.save
      if @vote.positivo == true
        @c.increment!(:positive_votes, 1)
        User.update(@cu.id, :puntos => @cu.puntos + 5)
      else
        @c.increment!(:negative_votes, 1)
        User.update(@cu.id, :puntos => @cu.puntos - 2)
      end

      if Acvote.exists?(:user_id => current_user.id, :acomment_id => @c.id, :positivo => !(@vote.positivo))
        @v = Acvote.find_by(:user_id => current_user.id, :acomment_id => @c.id, :positivo => !(@vote.positivo))
        if @v.positivo == true
          @c.decrement!(:positive_votes, 1)
          User.update(@cu.id, :puntos => @cu.puntos - 7)
        else
          @c.decrement!(:negative_votes, 1)
          User.update(@cu.id, :puntos => @cu.puntos + 7)
        end
        @v.destroy
      end
      
      redirect_to @q
    else
      redirect_to @q, alert: "Hubo un error al borrar el voto."
    end
  end

  def destroy
    @c = Acomment.find(params[:acomment_id])
    @cu = @c.user
    @q = Question.find(@c.question_id)
    
    @vote = Acvote.where(:user_id => current_user.id, :acomment_id => @c.id, :positivo => params[:positivo])
    if @vote.first.positivo == true
      @c.decrement!(:positive_votes, 1)
      User.update(@cu.id, :puntos => @cu.puntos - 5)
    else
      @c.decrement!(:negative_votes, 1)
      User.update(@cu.id, :puntos => @cu.puntos + 2)
    end

    if @vote.destroy_all
      redirect_to @q
    else
      redirect_to @q, alert: "Hubo un error al borrar el voto."
    end
  end
end
