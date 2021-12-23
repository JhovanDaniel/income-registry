class CreateTaxpayersYears < ActiveRecord::Migration[6.1]
  def change
    create_table :taxpayers_years do |t|
      t.integer :taxpayer_id
      t.integer :year_id
      t.timestamps
    end
  end
end
