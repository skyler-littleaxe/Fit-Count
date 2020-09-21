class AddExercisePropertiesToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :sets, :integer
    add_column :exercises, :reps, :integer
    add_column :exercises, :lbs,  :integer
  end
end
