class AddUnreadMessageCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unread_message_count, :integer, :default => 0
    add_column :users, :profile_viewed_count, :integer, :default => 0
  end
end
