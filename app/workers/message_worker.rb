class MessageWorker
  include Sidekiq::Worker
  

  def perform(message)
    
    puts 'Message perform start:  -- '

    sender = User.find(message["sender_id"].to_i)
    recipient = User.find(message["recipient_id"].to_i)
    
    if sender.is_active
      opts = { :sender => sender, :recipient => recipient, :message => message }
      Mailer.send_notification(recipient.email, opts).deliver
    end  

    puts 'Message perform end:  -- '

  end

end
