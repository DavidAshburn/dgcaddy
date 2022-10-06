class AddUserIdToDiscs < ActiveRecord::Migration[7.0]
  def change
    add_column :discs, :user_id, :integer
    add_index :discs, :user_id
  end
end
