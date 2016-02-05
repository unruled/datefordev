# coding: utf-8

#
# -  Referral code set
#

desc 'referral code set'
  task :referral_code_set => :environment do

    puts " --   process start"
    
    User.where("referral_code IS NULL").each do |user|
        referral_code = "#{user.id}#{SecureRandom.hex(10)}"
        user.update_attributes(:referral_code => referral_code, :points => 35)
    end
    
    puts " --   process end"

  end