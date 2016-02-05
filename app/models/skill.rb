class Skill < ActiveRecord::Base
  belongs_to :language
  
  has_many :skill_traits
  has_many :traits, through: :skill_traits
  
  has_many :skill_questions
  
  validates_presence_of :name
end
