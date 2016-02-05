class DateprogDeviseMailer < Devise::Mailer
  
  default :from => "'#{I18n.t('dateprog')}' <no-reply@demo.com>"

  def self.mailer_name
    "devise/mailer"
  end
end