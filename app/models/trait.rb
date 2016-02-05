class Trait < ActiveRecord::Base
  belongs_to :language
  
  has_many :skill_traits
  has_many :skills, through: :skill_traits
  
  validates_presence_of :name
end
