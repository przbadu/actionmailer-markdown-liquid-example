class UserMailer < ApplicationMailer
  def welcome(user)
    message = I18n.t('user_mailer.welcome.body')

    mail to: user.email do |format|
      format.text {render plain: message}
      format.html {render html: Markdown.html(message).html_safe}
    end
  end
end
