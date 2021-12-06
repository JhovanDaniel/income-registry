class ChangeActiveStatusDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :taxpayers, :active_status, :string, :default => "Active"
  end
end
