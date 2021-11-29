class Taxpayer < ApplicationRecord 
    validates :ird_no, presence: true, length: {minimum: 6, maximum: 6}
    validates :first_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :last_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :address, presence: true, length: {minimum: 3, maximum: 25}
    validates :entity_type, presence: true, inclusion: { in: %w[Self-Employed Government Private] }
    validates :active_status, presence: true, inclusion: { in: %w[Active Inactive] }
end