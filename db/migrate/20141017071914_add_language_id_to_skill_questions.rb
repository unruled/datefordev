class AddLanguageIdToSkillQuestions < ActiveRecord::Migration
  def change
    add_column :skill_questions, :language_id, :integer
  end
end
