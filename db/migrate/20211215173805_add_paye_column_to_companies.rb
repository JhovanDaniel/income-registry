class AddPayeColumnToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :paye_no, :int
  end
end
