class Character < ApplicationRecord
    belongs_to :world
    belongs_to :user

    validates :name, presence: true, length: { minimum: 2 }
    validates :alignment, presence: true, length: { minimum: 2 }
    validates :species, presence: true, length: { minimum: 2 }
    validates :character_class, presence: true, length: { minimum: 2 }
end
