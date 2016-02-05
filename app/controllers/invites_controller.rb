class InvitesController < ApplicationController
  layout "girl"
  
  before_filter :authenticate_user!
  # GET /invites
  # GET /invites.json
  def index
    invite_query = Invite.all
  end
  
  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @error = false
    @error_email = false
    if params[:invite][:email1].present?
      if ValidateEmail.valid?(params[:invite][:email1])
        Invite.create(:user_id => current_user.id, :name => params[:invite][:name1], :email => params[:invite][:email1], :body => params[:invite][:body])
        google_analytics("invite", params[:invite][:name1])
      else
         @error_email = true  
      end  
      if params[:invite][:email2].present?
        if ValidateEmail.valid?(params[:invite][:email2])
          Invite.create(:user_id => current_user.id, :name => params[:invite][:name2], :email => params[:invite][:email2], :body => params[:invite][:body])
          google_analytics("invite", params[:invite][:name2])
        else
          @error_email = true
        end
      end  
      if params[:invite][:email3].present?
        if ValidateEmail.valid?(params[:invite][:email3])
          Invite.create(:user_id => current_user.id, :name => params[:invite][:name3], :email => params[:invite][:email3], :body => params[:invite][:body])
          google_analytics("invite", params[:invite][:name3])
        else
          @error_email = true
        end  
      end
    else
      @error = true
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update_attributes(invite_params)
        format.html { redirect_to invites_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit!
    end
end
