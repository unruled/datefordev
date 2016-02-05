class User::CourseLevelsController < ApplicationController

  layout "girl"

  before_action :authenticate_user!, :set_course
  before_action :set_course_level, only: [:show, :edit, :update, :destroy]
  
  # fetch latest chat messages  
  before_action do 
    fetch_messages 1
  end    
  
  def index
    if params[:clone].present? and params[:course_level_id].present?
      last_record = current_user.instructor_courses.find_by_id(@course.id).course_levels.find_by_id(params[:course_level_id])
      if last_record.present?
        new_record = last_record.dup
        new_record.title = "copy of " + new_record.title
        new_record.save
        flash[:notice] = t("clone_created")
        # redirect to edit level page after cloning
        redirect_to edit_user_course_course_level_path(:id=> new_record.id)
        return
      end
    end
    @course_levels = current_user.instructor_courses.find_by_id(@course.id).course_levels
    @o_all = @course_levels.paginate(:per_page => 10, :page => params[:page])
  end

  def show

  end

  def new
    @course_level = CourseLevel.new(:course_id => params[:course_id])
    # if we have test course type OR we have param to create question only
    # check if we need to add question only
    if params[:is_question].present? 
      @course_level.level_type = :is_question
    end
    set_default_values
  end

  def edit
  end

  def create
    @course_level = CourseLevel.new(course_levels_params)
    respond_to do |format|
      # check value of submit button 
      if params[:verify].present?
        # checking answer using temporary @course_level object
        @course_level.answer = course_levels_params[:answer]
        @course_level.test_answer = course_levels_params[:test_answer]
        @verification_success = nil
        @verification_error = nil

        if @course_level.test_answer_match?
          @verification_success = course_levels_params[:congratulations].empty? ? t("correct") : course_levels_params[:congratulations].strip
        else
          @verification_error = course_levels_params[:error_message].empty? ? t("incorrect") : course_levels_params[:error_message].strip
        end
        format.js
      else
        if params[:is_question].present?
          @course_level.level_type = :is_question 
          logger.info "set to is question"
        end

        if @course_level.save
          flash[:notice] = t("successfully_created")
          if params[:submit]
            format.js { render ajax_redirect_to(user_course_course_levels_path(@course)) }
          else
            format.js { render ajax_redirect_to(edit_user_course_course_level_path(@course, @course_level)) }
          end
        else
          flash.now[:error] = t("please_correct_above_errors")
          format.js
        end
      end
    end
  end

  def update
    respond_to do |format|
      # if in the verification mode
      if params[:verify].present?
        answer = course_levels_params[:answer]
        
        test_answer = course_levels_params[:test_answer]
        @course_level.answer = answer
        @course_level.test_answer = test_answer        
        @course_level.case_sensitive = course_levels_params[:case_sensitive]
        @course_level.regular_expression = course_levels_params[:regular_expression]
        @course_level.error_message = course_levels_params[:error_message]
        @verification_success = nil
        @verification_error = nil
        if @course_level.test_answer_match?
          @verification_success = course_levels_params[:congratulations].empty? ? t("correct") : course_levels_params[:congratulations].strip
        else
          @verification_error = course_levels_params[:error_message].empty? ? t("incorrect") : course_levels_params[:error_message].strip
        end
        format.js
      else     
        # else just saving
        if @course_level.update(course_levels_params)
          flash[:notice] = t("successfully_updated")
          # submit 
          if params[:submit]
            format.js { render ajax_redirect_to(user_course_course_levels_path(@course)) }
          else
            # or just save what we have
            format.js { render ajax_redirect_to(edit_user_course_course_level_path(@course, @course_level)) }
          end
        else
          flash.now[:error] = t("please_correct_above_errors")
          format.js
        end
        
      end
    end
  end

  def destroy
    @course_level.destroy
    respond_to do |format|
      format.html { redirect_to user_course_course_levels_url(@course), notice: t('successfully_deleted') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_level
      @course_level = @course.course_levels.find_by_id(params[:id])
    end

    def set_course
      @course = current_user.instructor_courses.find_by_id(params[:course_id])
    end

    def course_levels_params
      params.require(:course_level).permit!
    end

    # set default values    
    def set_default_values    
      @course_level.title = t("course_level_sample_title")        
      @course_level.description = t("course_level_sample_description")
      @course_level.question = t("course_level_sample_question")
      @course_level.answer = t("course_level_sample_answer")
      @course_level.predefined_answer = t("course_level_sample_predefined_answer")
      @course_level.error_message = t("course_level_sample_error_message")
      @course_level.congratulations = t("course_level_sample_congratulations")
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

end
