class QuestionsController < ApplicationController
  def index
    @search = false
    if ((user_signed_in?) && (!current_user.faculty.nil?))
      @questions = Question.where(:faculty_id => current_user.faculty.id)
    else
      @questions = Question.all
    end

    if params[:tag]
      @questions = Question.tagged_with(params[:tag]).where(:faculty_id => current_user.faculty.id)
    end

    if params[:spregunta] || params[:sdetalles] || params[:sfacultad] || params[:stag]
      @search = true
      @questions = Question.search(params[:spregunta], params[:sdetalles], params[:sfacultad], params[:stag])
    end
    
    if params[:tag]
      @questions = Question.tagged_with(params[:tag])
    end

  end

  def show
    @question = Question.find(params[:id])
    @question.update_attribute(:visitas, @question.visitas + 1)
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id]).destroy
    redirect_to @question, notice: "Pregunta eliminada"
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: "Pregunta modificada."
    else
      render :edit
    end
  end
  
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if(!current_user.faculty.nil?)
      @question.faculty_id = current_user.faculty.id
    else
      @question.faculty_id = params[:faculty_id]
    end

    if @question.save
      @question.faculty.update_attribute(:cant_preguntas, @question.faculty.cant_preguntas + 1)
      redirect_to @question, notice: "Pregunta realizada."
    else
      render :new
    end
  end

  def rank
    @question.positive_votes-@question.negative_votes > 0
  end

  private
  def question_params
    params.require(:question).permit(:faculty_id, :pregunta, :detalles, :tag_list, tag_ids: [])
  end
end
