class CreateCoursekeys < ActiveRecord::Migration[7.0]
  def change
    create_table :coursekeys do |t|
      t.integer :pointer
      t.integer :count
      t.integer :user_id

      t.timestamps
    end
  end
end
