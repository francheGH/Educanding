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

  def self.tagged_with(nombre)
    Tag.find_by!(nombre: nombre).question
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:nombre).join(', ')
  end

  def tag_list=(nombres)
    self.tags = nombres.split(',').map do |n|
      Tag.where(nombre: n.strip).first_or_create!
    end
  end

end
