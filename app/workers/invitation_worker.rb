class InvitationWorker
  include Sidekiq::Worker

  def perform(id)
    
    resource = User.find(id)
   
    puts 'Invitation perform start:  -- '
    
    opts = { :resource => resource, :token => SecureRandom.hex(10), :password => resource.email.split("@")[0] }
    Mailer.send_invitation(resource.email, opts).deliver

    puts 'Invitation perform end:  -- '

  end

end
