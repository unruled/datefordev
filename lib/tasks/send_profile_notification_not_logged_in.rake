# coding: utf-8

#
# -  profile notifications
#

desc 'profile notifications for not logged in user from last 15 days'
	task :send_profile_notification_not_logged_in => :environment do

		puts " --   process start"
		
    all_users = User.active.where("current_sign_in_at < ?", 15.days.ago)

		all_users.each do |user|
		  
      if user.is_girl
        match_users = User.joins(:skill).where("confirmed_at > ? and gender = ? and is_girl = ?", Time.now.utc-7.days, user.opposite_gender, false)
        match_users = match_users.where(:skills => { :id => user.girl_match_skill(true) })
      else
        match_users = User.where("confirmed_at > ? and gender = ?", Time.now.utc-7.days, user.opposite_gender)
        match_users = match_users.where("girl_match_skill_id IN (?) OR skill_id > ?", user.programmer_match_skill_ids, 0)
      end

      if match_users.count > 0
        puts "matching count - #{match_users.count}"
        puts "mail send to - #{user.name}"
        user.update_attributes(:current_sign_in_at => Time.now.utc)
        Mailer.send_profile_notification_not_logged_in(match_users, user).deliver
      end

		end
  		
    
    
		puts " --   process end"

	end