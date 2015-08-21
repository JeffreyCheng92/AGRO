class ContactMailer < ApplicationMailer
  default from: "AGRO <contact@agr.online>"

  def contact_email
    mail(to: "JeffreyCheng92@gmail.com", subject: 'AGRO Issue')
  end

end
