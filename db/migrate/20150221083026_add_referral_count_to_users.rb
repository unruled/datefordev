class AddReferralCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referral_count, :integer, :default => 1
  end
end
