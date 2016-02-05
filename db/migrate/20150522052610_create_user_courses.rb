class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|

      t.references :user
    	t.references :course
    	t.integer :passed_levels, :default => 0
    	t.boolean :is_completed, :default => false

      t.timestamps
    end
  end
end
