class AddFilterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :filter, :text
  end
end
