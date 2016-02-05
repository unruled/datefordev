class AddInvitationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitation, :boolean, :default => false
  end
end
