# coding: utf-8

#
# -  profile notifications
#

desc 'public photo upload'
	task :public_photo_upload => :environment do

		puts " --   process start"
		
      date_before_3_days = (Time.now.utc - 3.days).to_date
      date_before_7_days = (Time.now.utc - 7.days).to_date

  		all_users = User.active.where("notification = ? 
                              and avatar_file_name IS NULL
                              and (DATE(confirmed_at) = ? or DATE(confirmed_at) = ?)", true, date_before_3_days, date_before_7_days)
  		all_users.each do |user|
        puts "mail send to - #{user.name}"
        Mailer.send_public_photo_upload(user).deliver
  		end

		puts " --   process end"

	end