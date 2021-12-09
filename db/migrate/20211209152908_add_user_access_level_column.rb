class AddUserAccessLevelColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :access_level, :string
  end
end
