class CreateSkillQuestions < ActiveRecord::Migration
  def change
    create_table :skill_questions do |t|
      t.integer :skill_id
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
