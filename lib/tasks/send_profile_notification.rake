# coding: utf-8

#
# -  profile notifications
#

desc 'profile notifications'
	task :profile_notification => :environment do

		puts " --   process start"
		
		if Time.now.utc.wednesday?
  		all_users = User.active.where("notification_profile = ? and filter IS NOT NULL", true)
    else
      all_users = User.active.where("notification_profile = ? and filter IS NOT NULL and referral_count >= ?", true, 10)
    end

		all_users.each do |user|

      filter_values = ActiveSupport::JSON.decode(user.filter) if user.filter.present?

      if filter_values.present? and (filter_values["is_age"] or filter_values["avatar"] or filter_values["is_country"] or filter_values["is_city"] or filter_values["programmer"])
		  
        if user.is_girl
          match_users = User.active.joins(:skill).where("confirmed_at > ? and gender = ? and is_girl = ?", Time.now.utc-7.days, user.opposite_gender, false)
          match_users = match_users.where(:skills => { :id => user.girl_match_skill(true) })
        else
          match_users = User.active.where("confirmed_at > ? and gender = ?", Time.now.utc-7.days, user.opposite_gender)

          if filter_values.present? and filter_values["programmer"]
            match_users = match_users.where("skill_id > ?", 0)
          else
            match_users = match_users.where("girl_match_skill_id IN (?) OR skill_id > ?", user.programmer_match_skill_ids, 0)
          end
        end
      

        if filter_values["is_age"]
          age_arr = filter_values["age"].split(",")
          match_users = match_users.where(age: age_arr[0]..age_arr[1])
        end
        if filter_values["avatar"]
          match_users = match_users.where("avatar_file_name IS NOT NULL")
        end
        if filter_values["country"] and filter_values["is_country"]
          match_users = match_users.where("country = ?", filter_values["country"])
        end
        if filter_values["city"] and filter_values["is_city"]
          match_users = match_users.where("city LIKE ?", "%#{filter_values["city"]}%")
        end          

        if match_users.count > 0
          puts "matching count - #{match_users.count}"
          puts "mail send to - #{user.name}"
          Mailer.send_profile_notification(match_users, user).deliver
        end          

      end
      
		end
  		
    
    
		puts " --   process end"

	end