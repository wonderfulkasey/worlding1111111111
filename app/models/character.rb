class Character < ApplicationRecord
    belongs_to :world
    belongs_to :user

    validates :name, presence: true, length: { minimum: 2 }
end
