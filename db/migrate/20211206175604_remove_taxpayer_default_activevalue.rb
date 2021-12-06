class RemoveTaxpayerDefaultActivevalue < ActiveRecord::Migration[6.1]
  def change
    change_column :taxpayers, :active_status, :string
  end
end
