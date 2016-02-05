class Language < ActiveRecord::Base
  validates_presence_of :name, :code
  
  has_many :advertises
  has_many :tips
  has_many :courses
end
