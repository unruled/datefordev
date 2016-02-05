class AddCourseTypeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_type, :integer, default: 0
  end
end

