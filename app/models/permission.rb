class Permission < ApplicationRecord

  scope :puntajes, -> {
    order('puntos ASC') #Permisos por orden de puntos
  }

end
