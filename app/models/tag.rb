class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :questions, through: :taggings

    def self.counts
        self.select("nombre, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.nombre")
    end
end
