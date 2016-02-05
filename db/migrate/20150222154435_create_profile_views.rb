class CreateProfileViews < ActiveRecord::Migration
  def change
    create_table :profile_views do |t|
      t.integer :from
      t.integer :to
      t.datetime :last_view
      t.integer :view_count, :default => 0
      t.boolean :is_read, :default => false
      t.timestamps
    end
  end
end