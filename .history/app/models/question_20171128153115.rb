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
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by!(nombre: name).questions
  end

  def tag_list
    self.tags.map(&:nombre).join(', ')
  end

  def tag_list=(nombres)
    self.tags = nombres.split(',').map do |nombre|
      Tag.where(nombre: nombre.strip).first_or_create!
    end
  end

end
