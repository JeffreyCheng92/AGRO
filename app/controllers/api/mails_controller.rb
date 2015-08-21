class Api::MailsController < ApplicationController
  def create
    email = params[:data][:email]
    feedback = params[:data][:feedback]

    msg = ContactMailer.contact_email(email, feedback)
    msg.deliver_now

    render json: {cool: "beans"}
  end
end
