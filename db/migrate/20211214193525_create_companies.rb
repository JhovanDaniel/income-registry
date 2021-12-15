class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      
      t.integer :ird_no
      t.string :name
      t.string :address
      t.string :entity_type
      t.string :activity_status

      t.timestamps
    end
  end
end
