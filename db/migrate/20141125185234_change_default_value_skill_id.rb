class ChangeDefaultValueSkillId < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :skill_id, :integer, :default => 0
    end
  end
  def self.down
    change_table :users do |t|
      t.change :skill_id, :integer
    end
  end
end
