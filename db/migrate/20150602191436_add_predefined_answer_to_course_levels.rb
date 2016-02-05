class AddPredefinedAnswerToCourseLevels < ActiveRecord::Migration
  def change
    add_column :course_levels, :predefined_answer, :text
  end
end
