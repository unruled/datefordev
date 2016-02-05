module DeviseHelper
  def devise_error_messages!
     resource.errors.full_messages.map { |msg| msg == 'Email not found' ? t('user_not_found') : msg }.join('<br/>')
  end
end