class CreateProfileAccesses < ActiveRecord::Migration
  def change
    create_table :profile_accesses do |t|
      t.integer :from
      t.integer :to
      t.boolean :allow, :default => false
      t.timestamps
    end
  end
end
