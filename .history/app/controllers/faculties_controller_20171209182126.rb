class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end

  def show
    @faculty = Faculty.find(params[:id])
    @faculty.update_attribute(:visitas, @faculty.visitas + 1)
  end

  def new
    @faculty = Faculty.new
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      redirect_to @faculty, notice: "Facultad creada."
    else
      render :new, alert: "Hubo un error al crear la facultad."
    end
  end

  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update(faculty_params)
      redirect_to @faculty, notice: "Facultad modificada."
    else
      render :edit, alert: "Hubo un error al modificar la facultad."
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    if @faculty.destroy
      render :index, notice: "Facultad borrada."
    else
      render :index, alert: "Hubo un error al borrar la facultad."
    end
  end

  private
  def faculty_params
    params.require(:faculty).permit(:universidad, :facultad, :provincia, :ciudad)
  end
end
