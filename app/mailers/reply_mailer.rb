class ReplyMailer < ApplicationMailer
  def reply_to_query(reply)
    @reply = reply
    mail to: "#{reply.query.email}", 
         subject: "#{reply.subject}",
         body: "#{reply.body}",
         content_type: "text/html"
  end
end
