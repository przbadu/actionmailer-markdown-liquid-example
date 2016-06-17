class UserMailer < ApplicationMailer
  def activation_email(user)
    @name = user.name
    @activation_url = user_url(user.id)
    mail to: user.email
  end

  def welcome_email(user)
    @name = user.name
    @activation_url = user_url(user.id)
    @content = %(
      <p>Hello, {{name}}!</p>

        <p>This is welcome email<br/>

        You have to <a href={{activation_url}}>{{activation_url}}</a>. <br/>

        Thanks,<br/>

        --<br/>
        Freewheeler</p>
    )
    mail to: user.email, subject: 'Welcome email'
  end
end
