class Character < ApplicationRecord
    belongs_to :world
    belongs_to :user

    validates :name, presence: true
    validates :alignment, presence: true
    validates :species, presence: true
    validates :character_class, presence: true

    def self.search(query)
        where("name LIKE ?", "%#{query}%")
    end

end
