class AddLookingForToUsers < ActiveRecord::Migration
  def change
    add_column :users, :looking_for, :integer, :default => 0
  end
end
