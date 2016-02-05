class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer, :default => 0
    add_column :users, :referral_code, :string
  end
end
