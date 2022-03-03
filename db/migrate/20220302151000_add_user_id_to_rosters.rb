class AddUserIdToRosters < ActiveRecord::Migration[7.0]
  def change
    add_column :rosters, :user_id, :integer
    add_index :rosters, :user_id
  end
end
