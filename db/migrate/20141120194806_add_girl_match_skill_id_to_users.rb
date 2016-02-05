class AddGirlMatchSkillIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :girl_match_skill_id, :integer
  end
end
