class Question < ApplicationRecord
  scope :crono, -> {
    order('created_at ASC') #Preguntas en orden cronológico
  }
  scope :lista1, -> {
    order('cant_respuestas ASC') #Preguntas con menos respuestas
  }
  scope :lista2, -> {
    order('visitas DESC') #Preguntas mas visitadas
  }
  scope :lista3, -> {
    order('visitas ASC') #Preguntas menos visitadas
  }
  
  belongs_to :user
  belongs_to :faculty
  has_many :answers, dependent: :destroy
  has_many :qvotes, dependent: :destroy
  has_many :qcomments, dependent: :destroy
end
