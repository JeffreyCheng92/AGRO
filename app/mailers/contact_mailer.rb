class ContactMailer < ApplicationMailer
  default from: "AGRO <contact@agr.online>"

  def contact_email(from_email, content)
    @email, @feedback = from_email, content
    mail(to: "JeffreyCheng92@gmail.com", subject: 'AGRO Issue')
  end

end
