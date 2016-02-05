class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.references :language
      t.text :content
      t.boolean :for_girl, :default => false
      t.timestamps
    end
  end
end
