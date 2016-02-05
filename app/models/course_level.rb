# coding: utf-8
class CourseLevel < ActiveRecord::Base
  default_scope {order('position ASC')}
  enum level_type: { is_level: 0, is_question: 1 }

  belongs_to :course
  validates :title, :description, :question, :answer, :course_id, :presence => true
  attr_accessor :test_answer
  
 	after_initialize :default_values

	def default_values
		if self.new_record?
    	self.position = CourseLevel.last.present? ? CourseLevel.last.position+1 : 1
    end
	end  

  def test_answer_match?
  	if test_answer.present? and !test_answer.blank? and answer.present?
  		self.test_answer = self.test_answer.squish unless self.test_answer.blank?		
  		self.answer = self.answer.squish unless self.answer.blank?	
  		
  		if regular_expression
  			# replacing all whitespaces to \s*
  			self.answer = ("\\s*" + self.answer.gsub(/\s+/, "\\s*") + "\\s*") unless self.answer.blank?		
  		end
  		
  		logger.info '####################'
  		logger.info 'test_answer_match?: '
  		logger.info "self.test_answer: " + self.test_answer
  		logger.info 'self.answer: ' + self.answer
  		logger.info '####################'

			# comparing answers
			begin
		  	# case sensitive comparision
		  	if case_sensitive
		  	  if regular_expression
		  	    return true if test_answer.match(/(?m)#{answer}/)
		  	  else
		        return true if test_answer == answer
		  	  end
		  	else
		  		# NON case sensitive
		  	  if regular_expression
		  	    return true if test_answer.downcase.match(/(?im)#{answer}/)
		  	  else
		        return true if test_answer.downcase == answer.downcase
		  	  end
		  	end
			rescue Exception => e  
			  logger.error e.message  
			  # puts e.backtrace.inspect  	  	
	  		return false
	  	end
	  end
  	return false
  end

end
