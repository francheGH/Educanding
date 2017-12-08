class Faculty < ApplicationRecord
  has_many :questions

  scope :alfab, -> {
    order('facultad ASC') #Facultades en orden alfabético
  }
  scope :lista1, -> {
    order('cant_preguntas DESC') #Preguntas con mas respuestas
  }
  scope :lista2, -> {
    order('cant_preguntas ASC') #Preguntas con menos respuestas
  }

  def facultad_y_universidad
    "#{facultad} | #{universidad}"
  end

end
