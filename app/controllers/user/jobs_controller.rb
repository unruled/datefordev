class User::JobsController < ApplicationController

  autocomplete :tag, :name, :full => true, :display_value => :funky_method

  layout "girl"

  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action do 
    fetch_messages 1
  end  

  def index
    # if we publish job
    if params[:publish].present? && params[:job_id].present?
    last_record = current_user.jobs.find_by_id(params[:job_id])
      if last_record.present?
        # publishing the job:
        last_record.is_published = true
        last_record.is_approved = false
        last_record.save
        # send admin notification 
        AdminNotificationMailer.send_new_job_published(last_record, current_user).deliver
        redirect_to user_jobs_url
      end
    elsif params[:unpublish].present? && params[:job_id].present?
    last_record = current_user.jobs.find_by_id(params[:job_id])
      if last_record.present? && last_record.is_published
        # publishing the job:
        last_record.is_published = false
        last_record.is_approved = false
        last_record.save
        # send admin notification 
        AdminNotificationMailer.send_new_job_unpublished(last_record, current_user).deliver
        redirect_to edit_user_job_path(last_record.id)
      end
    # else if we clone job
    elsif params[:clone].present? && params[:job_id].present?
      last_record = current_user.jobs.find_by_id(params[:job_id])
      if last_record.present?
        logger.info "creating clone of job " + last_record.id.to_s
        new_record = last_record.dup
        new_record.is_published = false
        new_record.is_approved = false
        new_record.title = "copy of " + new_record.title
        new_record.save
        flash[:notice] = t("clone_created")
        redirect_to edit_user_job_path(new_record.id)
        return
      end
    end
    @o_all = current_user.jobs.paginate(:per_page => 10, :page => params[:page])
  end

  def show
    
  end

  def new
    @job = Job.new
    set_default_values
  end

  def edit

  end

  def create
    @job = Job.new(job_params)
    
    respond_to do |format|
      if @job.save
        format.html { redirect_to user_jobs_path, notice: t('successfully_created') }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to user_jobs_path, notice: t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to user_jobs_url, notice: t('successfully_deleted') }
      format.json { head :no_content }
    end
  end

  private

    def set_job
      @job = current_user.jobs.find_by_id(params[:id])
    end

    def job_params
      params.require(:job).permit!
    end

    # set default values
    def set_default_values    
      @job.title = t("job_sample_title")
      @job.description = t("job_sample_description")      
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
