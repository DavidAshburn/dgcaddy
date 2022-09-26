class CreateLayouts < ActiveRecord::Migration[7.0]
  def change
    create_table :layouts do |t|
      t.string :name
      t.integer :length
      t.string :pars
      t.integer :course_id

      t.timestamps
    end
    add_index :layouts, :course_id
  end
end
