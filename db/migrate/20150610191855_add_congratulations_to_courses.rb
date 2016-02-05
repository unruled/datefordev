class AddCongratulationsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :congratulations, :text
    add_column :course_levels, :congratulations, :text
    change_column :course_levels, :error_message, :text
  end
end
