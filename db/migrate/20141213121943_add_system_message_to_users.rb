class AddSystemMessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :system_message, :boolean, :default => true
    add_column :users, :profile_activity, :boolean, :default => true
    add_column :users, :site_news, :boolean, :default => true
  end
end
