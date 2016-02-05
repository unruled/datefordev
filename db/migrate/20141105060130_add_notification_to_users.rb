class AddNotificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notification, :boolean, :default => true
    add_column :users, :notification_token, :string
  end
end
