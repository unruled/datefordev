class UserCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  scope :completed, -> { where(:is_completed => true) }
end
