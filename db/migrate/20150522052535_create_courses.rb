class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|

    	t.integer :instructor_id
    	t.references :language
      t.string :title
      t.text :description
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.boolean :is_published, :default => false
      t.boolean :is_approved, :default => false

      t.timestamps
    end
  end
end
