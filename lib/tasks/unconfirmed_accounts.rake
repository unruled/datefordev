# coding: utf-8

#
# -  
#

desc 'unconfirmed accounts remove'
	task :unconfirmed_accounts => :environment do

		puts " --   process start"
		
      date_before_7_days = (Time.now.utc - 7.days).to_date

  		all_users = User.where("confirmed_at IS NULL and last_sign_in_at IS NULL and DATE(users.created_at) < ?", date_before_7_days)
  		all_users.each do |user|
        puts "destroy - #{user.name}"
        user.destroy
  		end

		puts " --   process end"

	end