class CourseLevelsController < ApplicationController

  layout "girl"

  before_action :authenticate_user!, :set_course
  before_action :set_course_level, only: [:update]

  # fetch latest chat messages  
  before_action do 
    fetch_messages 1
  end  
  
  def index
    @dashboard = "active"
    unless session[:course] == @course.id
      session[:level_number] = nil
    end
    @level_number = session[:level_number] ? session[:level_number].to_i : 1
    @show_finish_page = @level_number > @course.course_levels.count ? true : false
    if @show_finish_page 
      @level_number = nil 
    end
    session[:level_number] = @level_number
    session[:course] = @course.id
    if !@show_finish_page 
      @course_level = @course.course_levels.order("id ASC").limit(1).offset(@level_number-1).first
    else
      @course_level = nil
    end
  end

  def update
    @completed = false
    # show the last page
    if @show_finish_page 
      @success_course = @course.congratulations.present? ? @course.congratulations.strip : t("course_success")          
      # set level_number to +1 so next time will go to the course finish
      session[:level_number] = nil
      respond_to do |format|
        #format.js { render ajax_redirect_to(courses_path) }
        format.js {}
      end
    # else check answer
    elsif params[:course_level].present? && params[:course_level][:answer].present?
      @course_level.test_answer = params[:course_level][:answer]
      if @course_level.test_answer_match?
        user_course = @course.user_courses.find_or_create_by(user: current_user)
        course_completed = (session[:level_number] == @course.course_levels.count) ? true : false
        user_courses_params = { :passed_levels => session[:level_number], :is_completed => course_completed }
        user_course.update_attributes(user_courses_params)
        # if all levels are completed
        if user_course.is_completed
          @completed = true
          # congrats message
          @success_course = @course.congratulations.present? ? @course.congratulations.strip : t("level_success")
          # add technology to the list of techologies of the user
          current_user.technology_list.add(@course.technology_list.join(","))
          current_user.save
          respond_to do |format|
            #format.js { render ajax_redirect_to(courses_path) }
            format.js {}
          end
        else
          # if there are levels left then show congrats for current level
          # and go to the next one
          @success = @course_level.congratulations.present? ? @course_level.congratulations.strip : t("level_success")
          
          # if session has empty level_number then set it to the 1st level
          if !session[:level_number].present?
            session[:level_number] = 1
          end
          
          # increase the counter
          session[:level_number] = session[:level_number] + 1
        
          respond_to do |format|
            #format.js { render ajax_redirect_to(course_course_levels_path(@course.id)) }
            format.js {}
          end
        end
      else
        # show error
        @error = @course_level.error_message.present? ? @course_level.error_message.strip : t("level_failed")
        respond_to do |format|
          format.html { render :nothing => true, :layout => ! request.xhr? }
          format.js {}
        end
      end
    else
      # asking to provide answer
      @error = t("please_provide_answer")
      respond_to do |format|
        format.html { render :nothing => true, :layout => ! request.xhr? }
        format.js {}
      end
    end
  end
  
  # fetch chat messages
  def fetch_messages page
      @message = Message.new
      message_users = current_user.received_sent_messages.includes(:sender, :recipient).order("id desc").group("messages.id, messages.sender_id, messages.recipient_id")
      @message_users_hash = {}
      message_users.each do |message|
        unless message.sender_id == current_user.id
          sender = message.sender
          if sender.present? && sender.is_activated?
            @message_users_hash[message.sender_id] = message.sender unless @message_users_hash[message.sender_id].present?
          end
        end
        unless message.recipient_id == current_user.id
          recipient = message.recipient
          if recipient.present? && recipient.is_activated?
            @message_users_hash[message.recipient_id] = message.recipient unless @message_users_hash[message.recipient_id].present?
          end
        end
      end
  end    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_level
      @course_level = CourseLevel.find_by_id(params[:id])
    end

    def set_course
      @course = Course.find_by_id(params[:course_id])
    end

end
