class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.references :language
      t.string :name
      t.integer :index

      t.timestamps
    end
  end
end
