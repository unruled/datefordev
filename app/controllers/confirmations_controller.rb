class ConfirmationsController < Devise::ConfirmationsController
  
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      session[:sign_in] = "true"
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)

      if resource.referred_user_id.present?
        referred_user = User.find(resource.referred_user_id)
        if referred_user.present?
          referred_user.update_attributes(:referral_count => (referred_user.referral_count + 1))
          # log the even for the original source user to save his referral counts
          google_analytics("user", "referred-registered", referred_user)
        end
      end
      
      Mailer.send_confirmed_registration(resource).deliver
      
      respond_with_navigational(resource){ redirect_to
            after_confirmation_path_for(resource_name, resource) }
    else
      redirect_to root_path
    end
  end
  
end