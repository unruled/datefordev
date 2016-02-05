class User::CoursesController < ApplicationController

  autocomplete :tag, :name, :full => true, :display_value => :funky_method

  layout "girl"

  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action do 
    fetch_messages 1
  end  

  def index
    # if we publish course
    if params[:publish].present? && params[:course_id].present?
    last_record = current_user.instructor_courses.find_by_id(params[:course_id])
      if last_record.present?
        # publishing the course:
        # should have at least 3 levels
        if last_record.course_levels.length > 2 
          last_record.is_published = true
          last_record.is_approved = false
          last_record.save
          # send admin notification 
          AdminNotificationMailer.send_new_course_published(last_record, current_user).deliver
        else 
          flash[:error] = t("course_should_have_at_least_levels")
        end
        redirect_to user_courses_url
      end
    # if we UNpublish course
    elsif params[:unpublish].present? && params[:course_id].present?
    last_record = current_user.instructor_courses.find_by_id(params[:course_id])
      if last_record.present? && last_record.is_published
        # publishing the course:
        # should have at least 3 levels
        last_record.is_published = false
        last_record.is_approved = false
        last_record.save
        # send admin notification 
        AdminNotificationMailer.send_new_course_unpublished(last_record, current_user).deliver
        redirect_to edit_user_course_path(last_record.id)
      end      
    # else if we clone course
    elsif params[:clone].present? && params[:course_id].present?
    last_record = current_user.instructor_courses.find_by_id(params[:course_id])
      if last_record.present?
        logger.info "creating clone of course " + last_record.id.to_s
        new_record = last_record.dup
        new_record.is_published = false
        new_record.is_approved = false
        new_record.title = "copy of " + new_record.title
        # clonning all levels
        last_record.course_levels.each do |cc|
          new_record.course_levels << cc.dup
        end        
        new_record.save
        flash[:notice] = t("clone_created")
        redirect_to edit_user_course_path(new_record.id)
        return
      end
    end
    @o_all = current_user.instructor_courses.paginate(:per_page => 10, :page => params[:page])
  end

  def show
    
  end

  def new
    @course = Course.new
    set_default_values
    # if it is not the course but the test only (course without description but just question)
    if params[:is_test].present?
      @course.course_type = :is_test
    end
  end

  def edit

  end

  def create
    @course = Course.new(course_params)
    
    respond_to do |format|
      if @course.save
        format.html { redirect_to user_courses_path, notice: t('successfully_created') }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to user_courses_path, notice: t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to user_courses_url, notice: t('successfully_deleted') }
      format.json { head :no_content }
    end
  end

  private

    def set_course
      @course = current_user.instructor_courses.find_by_id(params[:id])
    end

    def course_params
      params.require(:course).permit!
    end

    # set default values
    def set_default_values    
      @course.title = t("course_sample_title")
      @course.description = t("course_sample_description")
      @course.congratulations = t("course_sample_congratulations")
    end
    
  # fetch chat messages
  def fetch_messages page
    unless page.present?
      page = 1
    end
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
