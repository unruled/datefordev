class AddSystemMessageToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :system_message, :boolean, :default => false
  end
end
