class World < ApplicationRecord
    belongs_to :user
    has_many :characters

    validates :name, presence: true, length: { minimum: 2 }

end
