class AddReportAbuseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :report_abuse, :integer, :default => 0
  end
end
