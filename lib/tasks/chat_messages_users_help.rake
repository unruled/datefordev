# coding: utf-8

#
# -  
#

desc 'chat messages users help'
	task :chat_messages_users_help => :environment do

		puts " --   process start"
		
      date_before_5_days = (Time.now.utc - 5.days).to_date

  		all_users = User.active.joins(:sent_messages).group("users.id").having("users.notification = ? 
                              and COUNT(messages.id) < 5 
                              and DATE(users.confirmed_at) = ?", true, date_before_5_days)
  		all_users.each do |user|
        if user.is_girl
          puts "non-programmer - mail send to - #{user.name}"
          Mailer.send_chat_messages_nonprogrammer_help(user).deliver
        else
          puts "programmer - mail send to - #{user.name}"
          Mailer.send_chat_messages_programmer_help(user).deliver          
        end
  		end

		puts " --   process end"

	end