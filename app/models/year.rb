class Year < ApplicationRecord
    
    has_many :taxpayer_years
    has_many :taxpayers, through: :taxpayer_years
    
    validates :name, presence: true, length: { minimum: 4, maximum: 4 }
    validates_uniqueness_of :name
    
end