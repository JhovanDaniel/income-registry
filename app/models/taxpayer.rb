require 'csv'
class Taxpayer < ApplicationRecord 
    
    belongs_to :company
    
    has_many :taxpayer_years
    has_many :years, through: :taxpayer_years
    
    validates :ird_no, uniqueness: true, presence: true, length: { is: 6 }
    validates :first_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :last_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :address, presence: true, length: {minimum: 3, maximum: 25}
    validates :entity_type, presence: true, inclusion: { in: %w[Self-Employed Government Private] }
    validates :activity_status, presence: true, inclusion: { in: %w[Active Inactive] }
    
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |taxpayer|
                csv << taxpayer.attributes.values_at(*column_names)
            end
        end
    end
end