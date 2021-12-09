class DropActiveStatusColumn < ActiveRecord::Migration[6.1]
  def change
     remove_column :taxpayers, :active_status
  end
end
