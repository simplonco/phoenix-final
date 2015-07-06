class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @contact = contact
    mail(to: 'hafid.traikzi@gmail.com', subject: 'Contact')
  end

end
