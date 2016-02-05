# coding: utf-8

#
# -  Update directory structure for resources media
#

require 'csv'
require 'valid_email'

desc 'Import resources from csv file'
	task :import_users => :environment do

		puts " --   process start"
		
		    if Rails.env == "production"
          filename = "#{Rails.root}/lib/import_users_2.csv"
        else
          filename = "#{Rails.root}/lib/import_users_2.csv"
        end    
        uid = 1
		    CSV.foreach(filename, :headers => true) do |row|
          puts row.to_hash.inspect
          
          girl = row.to_hash["is_girl"].gsub('"', '').strip
          is_girl = (girl == "TRUE") ? true : false
          email = row.to_hash["email"].downcase.gsub('"', '').strip
          secure_pass = email.split("@")
          username = row.to_hash["name"].present? ? row.to_hash["name"].gsub('"', '').strip : secure_pass[0]  
          age = row.to_hash["age"].present? ? row.to_hash["age"].gsub('"', '').strip.to_i : ""
          about_me = row.to_hash["about_me"].gsub('"', ' ').gsub("??", ",").strip if row.to_hash["about_me"].present?
          
          if secure_pass[0].length < 8
            c = 8 - secure_pass[0].length
            i = 1
            c.times do
              secure_pass[0] = secure_pass[0] + i.to_s
              i = i + 1
            end
          end
          
          resource = User.find_by_email(email)
          unless resource.present?
            if ValidateEmail.valid?(email)
              resource = User.new
              resource.email = email
              resource.username = username
              resource.password = secure_pass[0]
              resource.password_confirmation = secure_pass[0]
              resource.age = age
              resource.is_girl = is_girl
              resource.country = "Russia" 
              resource.skip_confirmation! # Needs to confirmation message authentication is expelled via email
              resource.save!
              
              if resource.is_girl
                if (resource.id.to_i/2)*2 == resource.id.to_i 
                  traits = {"0" => "Young","1" => "Generious","2" => "Attentive","3" => "Kind","4" => "Responsible","5" => "Gifted","6" => "Funny","7" => "Romantic","8" => "Resourceful","9" => "Practical","10" => "Love kids","11" => "Wealthy","12" => "Canny","13" => "Family-man","14" => "With bad habits","15" => "Modest","16" => "Conservative about sex"}.to_json
                else
                  traits = {"0" => "Middle aged","1" => "Frugal","2" => "Self-centric","3" => "Strict","4" => "Careless","5" => "Persistent","6" => "Accurate","7" => "Pragmatic","8" => "Conservative","9" => "Crazy","10" => "Do not love kids","11" => "Frugal","12" => "Sociable","13" => "Party-goer","14" => "Without bad habits","15" => "Comfort loving","16" => "Wild Thing"}.to_json 
                end
                resource.traits = traits
                if uid >= 1 and uid <= 230
                  girl_match_skill_id = 1
                elsif uid >= 231 and uid <= 460
                    girl_match_skill_id = 2
                elsif uid >= 461 and uid <= 690
                    girl_match_skill_id = 3
                elsif uid >= 691 and uid <= 910
                    girl_match_skill_id = 4
                elsif uid >= 911 and uid <= 1140
                    girl_match_skill_id = 5
                elsif uid >= 1140 and uid <= 1370
                    girl_match_skill_id = 6
                elsif uid >= 1371 and uid <= 1600
                    girl_match_skill_id = 7
                elsif uid >= 1601 and uid <= 1830
                    girl_match_skill_id = 8
                elsif uid >= 1831 and uid <= 2060
                    girl_match_skill_id = 9
                elsif uid >= 2061 and uid <= 2290
                    girl_match_skill_id = 10
                elsif uid >= 2291 and uid <= 2520
                    girl_match_skill_id = 11
                elsif uid >= 2521 and uid <= 2750
                    girl_match_skill_id = 12
                else
                  girl_match_skill_id = 13                                                                                                                                                                                      
                end
                
                resource.girl_match_skill_id = girl_match_skill_id
              end  

              unless about_me.present?
                if resource.is_girl
                  resource.about_me = I18n.translate("i_am_a_girl")
                else
                  resource.about_me = I18n.translate("i_am_a_prog")
                end
              else
                resource.about_me = about_me
              end
              
              resource.notification_token = "#{resource.id}#{SecureRandom.hex(10)}"
              #resource.is_active = false
              resource.save!  
              
    		      #opts = { :resource => resource, :token => SecureRandom.hex(10), :password => secure_pass[0] }
  	          #Mailer.send_invitation(resource.email, opts).deliver
            end  
	        end
	        
	        uid = uid + 1 

		    end

		puts " --   process end"

	end

  desc 'notification_token_set'
  task :notification_token_set => :environment do
    puts " --   process start"
    User.all.each do |u|
      unless u.notification_token.present?
        puts " --   #{u.id}"
        u.notification_token = "#{u.id}#{SecureRandom.hex(10)}"
        u.save
      end
    end
    puts " --   process end"
  end
