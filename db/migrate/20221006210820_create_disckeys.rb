class CreateDisckeys < ActiveRecord::Migration[7.0]
  def change
    create_table :disckeys do |t|
      t.integer :pointer
      t.integer :user_id

      t.timestamps
    end
    add_index :disckeys, :user_id
  end
end
