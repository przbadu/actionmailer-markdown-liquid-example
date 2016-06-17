class UserMailer < ApplicationMailer
  def activation_email(user)
    @name = user.name
    @activation_url = user_url(user.id)
    mail to: user.email
  end
end
