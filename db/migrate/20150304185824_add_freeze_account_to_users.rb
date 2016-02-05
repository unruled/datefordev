class AddFreezeAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :freeze_account, :boolean, :default => false
  end
end
