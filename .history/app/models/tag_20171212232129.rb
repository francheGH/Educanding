class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :questions, through: :taggings
    validates :nombre, presence:true, uniqueness:true

    def self.counts
        self.select("nombre, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.nombre")
    end

    def amount_of_tags
        errors.add(:tags, "deben haber entre 1 y 5 tags") if tags.size <1 && tags.size > 5
    end

    scope :alfab, -> {
        order('nombre ASC') #Etiquetas en orden alfabético
    }
end
