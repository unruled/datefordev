class AddPositionToCourseLevel < ActiveRecord::Migration
  def up
    add_column :course_levels, :position, :integer
    # copy all current positions as ids
    CourseLevel.update_all 'position=id'
  end

  def down
    remove_column :course_levels, :position
  end
  
end
