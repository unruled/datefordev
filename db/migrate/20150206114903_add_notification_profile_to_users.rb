class AddNotificationProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notification_profile, :boolean, :default => true
  end
end
