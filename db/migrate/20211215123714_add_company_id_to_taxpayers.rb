class AddCompanyIdToTaxpayers < ActiveRecord::Migration[6.1]
  def change
    add_column :taxpayers, :company_id, :int
  end
end
