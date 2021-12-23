class TaxpayerYear < ApplicationRecord
    belongs_to :taxpayer
    belongs_to :year
end