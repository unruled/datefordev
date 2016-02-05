class AddInstructorRequestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instructor_request, :boolean, :default => false
  end
end
