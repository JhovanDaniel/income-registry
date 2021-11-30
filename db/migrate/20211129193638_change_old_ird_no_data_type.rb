class ChangeOldIrdNoDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :taxpayers, :old_ird_no, :string
  end
end
