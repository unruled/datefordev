class AddErrorMessageToCourseLevels < ActiveRecord::Migration
  def change
    add_column :course_levels, :error_message, :string
  end
end
