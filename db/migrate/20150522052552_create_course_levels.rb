class CreateCourseLevels < ActiveRecord::Migration
  def change
    create_table :course_levels do |t|

    	t.references :course
      t.string :title
      t.text :description    	
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
