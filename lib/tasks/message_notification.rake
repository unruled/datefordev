# coding: utf-8

#
# -  Message notification
#

desc 'message notification'
	task :message_notification => :environment do

		puts " --   process start"
		
    messages = Message.where(:is_read => false, :is_send => false).group("recipient_id, id")
    messages.each do |message|
      u = message.recipient
      if u.present?
        received_unread_messages = u.received_messages.where(:is_read => false)
        received_unread_messages_count = received_unread_messages.count
        received_unread_messages_last = received_unread_messages.last
        
        if received_unread_messages_count > 0
          
          sender = received_unread_messages_last.sender
          recipient = received_unread_messages_last.recipient
          message = received_unread_messages_last
          if sender.present? and recipient.present?
            if recipient.unread_message_count == 0 or recipient.unread_message_count != received_unread_messages_count
              if sender.is_active and recipient.notification and !received_unread_messages_last.is_send
                puts " --  send email sender - #{sender.name}, recipient - #{recipient.name}"
                opts = { :sender => sender, :recipient => recipient, :message => message }
                received_unread_messages_last.update_attributes(:is_send => true)
                recipient.update_attributes(:unread_message_count => received_unread_messages_count)
                Mailer.send_notification(recipient.email, opts).deliver
              end
            end
          end
        else
          u.update_attributes(:unread_message_count => 0)
        end
      end
    end
		puts " --   process end"

	end