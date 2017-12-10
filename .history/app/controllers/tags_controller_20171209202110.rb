class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to @tag, notice: "Etiqueta creada."
    else
      render :new, alert: "Hubo un error al crear la Etiqueta."
    end
  end

  def edit
    @tag = Tag.find(params[:id])    
  end

  def update
    @tag = Tag.find(params[:id])
    if @Tag.update(Tag_params)
      redirect_to @tag, notice: "Etiqueta modificada."
    else
      render :edit, alert: "Hubo un error al modificar la etiqueta."
    end
  end

  def delete
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      render :index, notice: "Etiqueta borrada."
    else
      render :index, alert: "Hubo un error al borrar la etiqueta."
    end
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end
  
  private
  def tag_params
    params.require(:tag).permit(:nombre)
  end
end
