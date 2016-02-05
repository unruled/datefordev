class ChangeQuestionTypeToSkillQuesitons < ActiveRecord::Migration
  def change
    change_column :skill_questions, :question, :text
  end
end
