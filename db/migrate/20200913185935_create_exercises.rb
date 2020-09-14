class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :exercise_name
      t.text :exercise_notes
      t.integer :lifter_id

      t.timestamps null: false
    end
  end
end
