class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :user_id
      
      t.timestamps
    end
  end
end
