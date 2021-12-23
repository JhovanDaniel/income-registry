class ChangeTaxpayerYearsTableName < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :taxpayers_years, :taxpayer_years
  end

  def self.down
    rename_table :taxpayer_years, :taxpayers_years
  end
end
