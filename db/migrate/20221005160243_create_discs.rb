class CreateDiscs < ActiveRecord::Migration[7.0]
  def change
    create_table :discs do |t|
      t.string :manufacturer
      t.string :name
      t.float :speed
      t.float :glide
      t.float :turn
      t.float :fade
      t.float :diameter
      t.float :height
      t.float :rimdepth
      t.float :rimwidth

      t.timestamps
    end
  end
end
