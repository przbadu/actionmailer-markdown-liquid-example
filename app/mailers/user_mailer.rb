class UserMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  def activation_email(user)
    @name = user.name
    @activation_url = user_url(user.id)
    mail to: user.email
  end

  def welcome_email(user)
    # @name = user.name
    # @activation_url = user_url(user.id)
    @post = Post.first
    mail to: user.email, subject: 'Welcome email'
  end
end
