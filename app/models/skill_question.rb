class SkillQuestion < ActiveRecord::Base
  belongs_to :skill
  belongs_to :language
  validates_presence_of :question, :answer, :skill_id, :language_id

  scope :locale, ->(locale_id) { where(:language => locale_id)}
end
