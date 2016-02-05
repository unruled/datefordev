class Tip < ActiveRecord::Base
	belongs_to :language
	validates_presence_of :content
end
