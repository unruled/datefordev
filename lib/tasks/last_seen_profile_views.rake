# coding: utf-8

#
# -  
#

desc 'Last Signed In 30 days ago && profile viewed 1 or more times'
	task :last_seen_profile_views => :environment do

		puts " --   process start"
		
      date_before_30_days = (Time.now.utc - 30.days).to_date

  		all_users = User.active.where("notification = ?
                              and profile_views > 0
                              and DATE(updated_at) = ?", true, date_before_30_days)
  		all_users.each do |user|
        puts "mail send to - #{user.name}"
        Mailer.send_last_seen_profile_views(user).deliver
        user.update_attributes(:profile_views => 0)
  		end

		puts " --   process end"

	end