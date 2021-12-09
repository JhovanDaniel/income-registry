class NewActiveStatusColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :taxpayers, :activity_status, :string
  end
end
