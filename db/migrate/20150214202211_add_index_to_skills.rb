class AddIndexToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :index, :integer
  end
end
