class Tag < ApplicationRecord
    has_many :taggings
    has_many :questions, through: :taggings

    def self.counts
        self.select("DISTINCT(nombre), count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
    end
end
