class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user
      t.text :description
      t.string :title
      t.string :country
      t.string :city
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
