class AddIsInstructorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_instructor, :boolean, :default => true
  end
end
