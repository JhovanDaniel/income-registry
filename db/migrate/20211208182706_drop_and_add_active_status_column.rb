class DropAndAddActiveStatusColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :taxpayers, :active_status
    add_column :taxpayers, :active_status, :string
  end
end
