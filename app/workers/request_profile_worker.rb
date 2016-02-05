class RequestProfileWorker
  include Sidekiq::Worker
  

  def perform(profile_access)
    
    puts 'RequestProfile start:  -- '

    from = profile_access.allow_from
    to = profile_access.allow_to
    
    if to.is_active
      opts = { :from => from, :to => to }
      Mailer.send_request_profile(to.email, opts).deliver
    end

    puts 'RequestProfile end:  -- '

  end

end
