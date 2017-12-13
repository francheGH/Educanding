class PermissionsController < ApplicationController
  def index
    @permissions = Permission.all
  end

  def edit
    @permission = Permission.find(params[:id])
  end

  def update
    @permissions = Permission.find(params[:id])
    if @permissions.update(permission_params)
      redirect_to permissions_path, notice: "Permiso modificado."
    else
      render :edit
    end
  end

  private
  def permission_params
    params.require(:permission).permit(:nombre, :puntos)
  end
end
