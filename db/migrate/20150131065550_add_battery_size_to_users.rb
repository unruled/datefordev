class AddBatterySizeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :battery_size, :float, :default => 100
    add_column :users, :battery_date, :datetime, :null => false, :default => Time.now
  end
end
