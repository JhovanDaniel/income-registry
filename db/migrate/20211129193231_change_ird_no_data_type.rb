class ChangeIrdNoDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :taxpayers, :ird_no, :string

  end
end
