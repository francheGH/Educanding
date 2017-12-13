class Question < ApplicationRecord
  
  scope :crono, -> {
    order('created_at DESC') #Preguntas en orden cronológico
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
  
  scope :search, -> (spregunta, sdetalles, sfacultad, stag) {
    if( sfacultad != "" )
      if( stag != "" )
        where("pregunta LIKE ?", "%#{spregunta}%").where("detalles LIKE ?", "%#{sdetalles}%").where(faculty_id: sfacultad).joins(:tags).where(tags: { id: stag })
      else
        where("pregunta LIKE ?", "%#{spregunta}%").where("detalles LIKE ?", "%#{sdetalles}%").where(faculty_id: sfacultad)
      end
    else
      if( stag != "" )
        where("pregunta LIKE ?", "%#{spregunta}%").where("detalles LIKE ?", "%#{sdetalles}%").joins(:tags).where(tags: { id: stag })
      else
        where("pregunta LIKE ?", "%#{spregunta}%").where("detalles LIKE ?", "%#{sdetalles}%")
      end
    end
  }

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


  
  def validate_tags
    errors.add(:tags,"Debe seleccionar 5 etiquetas máximo") if tags.size > 5
  end
  
  belongs_to :user
  belongs_to :faculty
  has_many :answers, dependent: :destroy
  has_many :qvotes, dependent: :destroy
  has_many :qcomments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :detalles, presence:true
  validates :pregunta, presence:true, uniqueness:true
  validate :validate_tags

end
