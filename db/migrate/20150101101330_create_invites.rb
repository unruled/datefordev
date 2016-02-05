class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user
      t.string :name
      t.string :email
      t.text :body
      t.boolean :sent, :default => false
      t.timestamps
    end
  end
end
