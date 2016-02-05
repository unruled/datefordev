# coding: utf-8

#
# -  
#

desc 'private photo upload'
	task :private_photo_upload => :environment do

		puts " --   process start"
		
      date_before_9_days = (Time.now.utc - 9.days).to_date
      date_before_20_days = (Time.now.utc - 20.days).to_date

  		all_users = User.active.joins(:user_detail).where("users.notification = ? 
                              and user_details.avatar1_file_name IS NULL and user_details.avatar2_file_name IS NULL
                              and (DATE(users.confirmed_at) = ? or DATE(users.confirmed_at) = ?)", true, date_before_9_days, date_before_20_days)
  		all_users.each do |user|
        puts "mail send to - #{user.name}"
        Mailer.send_private_photo_upload(user).deliver
  		end

		puts " --   process end"

	end