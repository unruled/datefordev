class Mailer < ActionMailer::Base
  
  default :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>"

  def send_invitation(email, opts)
    @email = email
    @user = User.find_by_email(email)
    @resource = opts[:resource]
    @token = opts[:token]
    @password = opts[:password]
    I18n.with_locale(@user.locale) do
      mail(:to => email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("invitation_from_dateprog"))
    end
  end
  
  def send_invitation_by_user(invite)
    @invite = invite
    mail(:to => invite.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("invitation_from_dateprog"))
  end  
  
  def send_request_profile(email, opts)
    @from = opts[:from]
    @to = opts[:to]
    mail(:to => email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("allow_request_msg_subject", user: @from.name))
  end
  
  def send_allow_profile(email, opts)
    @from = opts[:from]
    @to = opts[:to]
    mail(:to => email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("accept_request_msg_subject", user: @to.name))
  end
  
  def send_confirmed_registration(user)
    @user = user
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("confirmed_registration_subject"))
    end
  end

  def send_public_photo_upload(user)
    @user = user
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("public_photo_upload_subject"))
    end
  end

  def send_private_photo_upload(user)
    @user = user
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("private_photo_upload_subject"))
    end
  end

  def send_chat_messages_nonprogrammer_help(user)
    @user = user
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("chat_messages_nonprogrammer_help_subject"))
    end
  end

  def send_chat_messages_programmer_help(user)
    @user = user
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("chat_messages_programmer_help_subject"))
    end
  end  
 
  def send_programmer_test_pass(user)
    @user = user
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("send_programmer_test_pass_subject"))
    end
  end  

  def send_last_seen_profile_views(user)
    @user = user
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("send_last_seen_profile_views_subject", user_name: @user.name))
    end
  end
  
  def send_notification(email, opts)
    @email = email
    @user = User.find_by_email(email)
    @sender = opts[:sender]
    @recipient = opts[:recipient]
    @message = opts[:message]
    I18n.with_locale(@user.locale) do
      mail(:to => email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("notification_from_subject", sender_name: @sender.name))
    end
  end
  
  def send_profile_notification(match_users, user)
    @user = user
    @match_users = match_users
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("profile_notification_subject"))
    end
  end    

  def send_profile_notification_not_logged_in(match_users, user)
    @user = user
    @match_users = match_users
    I18n.with_locale(@user.locale) do
      mail(:to => user.email, :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>", :subject => I18n.t("send_profile_notification_not_logged_in_subject"))
    end
  end
  
end