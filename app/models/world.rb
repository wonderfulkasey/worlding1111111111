class World < ApplicationRecord
    belongs_to :user
    has_many :characters

    validates :name, presence: true, length: { minimum: 2 }
    validates :aesthetic, presence: true, length: { minimum: 2 }
    validates :big_bad, presence: true, length: { minimum: 2 }
    validates :description, presence: true, length: { minimum: 2 }


    def self.search(query)
        where("name LIKE ?", "%#{query}%")
    end
    #defabc or search?
end
