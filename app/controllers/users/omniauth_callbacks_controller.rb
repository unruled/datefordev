class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    create
  end

  def twitter
    create
  end

  def google_oauth2
    create
  end

  def linkedin
    create
  end  

  def github
    create
  end  

  private

    def create
      auth_params = request.env["omniauth.auth"]

      provider = AuthenticationProvider.find_by_name(auth_params.provider)
      provider = AuthenticationProvider.create(:name => auth_params.provider) unless provider.present?

      authentication = provider.user_authentications.where(uid: auth_params.uid).first
      
      existing_user = current_user || User.where('email = ?', auth_params['info']['email']).first

      if authentication
        sign_in_with_existing_authentication(authentication)
      elsif existing_user
        create_authentication_and_sign_in(auth_params, existing_user, provider)
      else
        create_user_and_authentication_and_sign_in(auth_params, provider)
      end
    end

    def sign_in_with_existing_authentication(authentication)
      sign_in_and_redirect(:user, authentication.user)
    end

    def create_authentication_and_sign_in(auth_params, user, provider)
      UserAuthentication.create_from_omniauth(auth_params, user, provider)

      sign_in_and_redirect(:user, user)
    end

    def create_user_and_authentication_and_sign_in(auth_params, provider)
      user = User.create_from_omniauth(auth_params, provider)
      if user.valid?
        user.skip_confirmation!
        begin
          # if image exists
          if auth_params['info']['image'].present?
            info_image = auth_params['info']['image'].to_s.sub('"', '')
            # retrieving large size avatar from twitter
            if auth_params['provider'] == 'twitter'
                user.avatar = info_image.sub("_normal", "")
            else 
              # any other
              user.avatar = process_uri(info_image)
            end
          end
        rescue
        end
        user.is_girl = true
        user.save

        referral_code = "#{user.id}#{SecureRandom.hex(10)}"
        user.update_attributes(:referral_code => referral_code, :last_sign_in_at => Time.now.utc, :locale => I18n.locale)

        create_authentication_and_sign_in(auth_params, user, provider)
      else
        flash[:notice] = user.errors.full_messages.first
        redirect_to new_user_session_url, :notice => flash[:notice]
      end
    end

    def process_uri(uri)
      avatar_url = URI.parse(uri)
      avatar_url.scheme = 'https'
      avatar_url.to_s
    end    
end
