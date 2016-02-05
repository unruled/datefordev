class AllowProfileWorker
  include Sidekiq::Worker
  

  def perform(profile_access)
    
    puts 'AllowProfile start:  -- '

    from = profile_access.allow_from
    to = profile_access.allow_to
    
    if to.is_active
      opts = { :from => from, :to => to }
      Mailer.send_allow_profile(from.email, opts).deliver
    end

    puts 'AllowProfile end:  -- '

  end

end
