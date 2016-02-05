class AddLevelTypeToCourseLevel < ActiveRecord::Migration
  def change
    add_column :course_levels, :level_type, :integer, default: 0
  end
end
