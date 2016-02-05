# coding: utf-8

#
# -  Send Invitation
#

desc 'send invitation'
	task :send_invitation => :environment do

		puts " --   process start"
		
    Invite.where(:sent => false).each do |invite|
        invite.update_attributes(:sent => true)
        if invite.user
          puts " --  send invitation - sender - #{invite.user.name}, recipient - #{invite.email}"
          Mailer.send_invitation_by_user(invite).deliver
        end
    end
    
		puts " --   process end"

	end