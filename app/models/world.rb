class World < ApplicationRecord
    belongs_to :user
    has_many :characters

    validates :name, presence: true
    validates :aesthetic, presence: true
    validates :big_bad, presence: true
    validates :description, presence: true


    def self.search(query)
        where("name LIKE ?", "%#{query}%")
    end
    
    
end
