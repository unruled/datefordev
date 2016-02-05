class Advertise < ActiveRecord::Base
  belongs_to :skill
  belongs_to :language
  validates_presence_of :body, :start_time, :expiration_time, :gender
end
