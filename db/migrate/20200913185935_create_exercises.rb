class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :name
      t.integer :lifter_id

      t.timestamps null: false
    end
  end
end
