class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @contact = contact
    mail(to: 'hafid.traikzi@gmail.com', from: 'hafid.traikzi@gmail.com')
  end

end
