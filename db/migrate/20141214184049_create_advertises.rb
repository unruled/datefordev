class CreateAdvertises < ActiveRecord::Migration
  def change
    create_table :advertises do |t|
      t.text :body
      t.references :language
      t.datetime :start_time
      t.datetime :expiration_time
      t.boolean :programmer_only, :default => false
      t.references :skill
      t.boolean :is_active, :default => false
      t.timestamps
    end
  end
end