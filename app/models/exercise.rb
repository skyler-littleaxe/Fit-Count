class Exercise < ActiveRecord::Base
    belongs_to :lifter, class_name: "User"
    validates :exercise_name, presence: true
    validates :exercise_notes, presence: true

end
