class CustomMailer < ApplicationMailer
  def create_custom_mail(custom_mail)
    mail to: custom_mail.recipient_mail,
         subject: custom_mail.subject,
         body: custom_mail.body,
         content_type: "text/html"
  end
end
