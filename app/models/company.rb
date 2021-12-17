class Company < ApplicationRecord
    
    has_many :taxpayers
    
    validates :ird_no, uniqueness: true, presence: true, length: {minimum: 6, maximum: 6}
    validates :name, presence: true, length: {minimum: 3, maximum: 25}
    validates :address, presence: true, length: {minimum: 3, maximum: 25}
    validates :entity_type, presence: true, inclusion: { in: %w[Self-Employed Government Private] }
    validates :activity_status, presence: true, inclusion: { in: %w[Active Inactive] }
    validates :paye_no, uniqueness: true, presence: true
end