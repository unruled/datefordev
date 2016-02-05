class AddCaseSensitiveToCourseLevels < ActiveRecord::Migration
  def change
    add_column :course_levels, :case_sensitive, :boolean, :default => false
    add_column :course_levels, :regular_expression, :boolean, :default => false
  end
end
