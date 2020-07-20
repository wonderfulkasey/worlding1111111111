class Character < ApplicationRecord
    belongs_to :world
    belongs_to :user, through: :world

    validates :name, length: { minimum: 2 }
end
