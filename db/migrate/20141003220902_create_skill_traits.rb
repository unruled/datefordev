class CreateSkillTraits < ActiveRecord::Migration
  def change
    create_table :skill_traits do |t|
      t.references :skill, index: true
      t.references :trait, index: true

      t.timestamps
    end
  end
end
