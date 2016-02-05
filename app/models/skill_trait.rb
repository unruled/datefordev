class SkillTrait < ActiveRecord::Base
  belongs_to :skill
  belongs_to :trait

 validates_presence_of :skill_id, :trait_id
 
 validates_uniqueness_of :trait_id, :scope => :skill_id  
end
