class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :name
      t.integer :length, :default => 9
      t.string :pars, :default => '333333333'
      t.integer :course_id

      t.timestamps
    end
    add_index :variants, :course_id
  end
end
