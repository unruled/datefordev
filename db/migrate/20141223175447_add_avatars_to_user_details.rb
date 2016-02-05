class AddAvatarsToUserDetails < ActiveRecord::Migration
  def self.up
    add_attachment :user_details, :avatar1
    add_attachment :user_details, :avatar2
  end

  def self.down
    remove_attachment :user_details, :avatar1
    remove_attachment :user_details, :avatar2
  end
end
