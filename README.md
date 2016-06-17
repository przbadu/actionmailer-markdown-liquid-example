Test Actionmailer-markdown and shopify/liquid
______________________________________________

### Development setup

    $ bundle install
    $ rake db:migrate db:seed
    $ rails s
    # visit http://localhost:3000

#### Quick outputs:

To see quick output visit following urls:

1. `actionmailer-markdown`

(http://localhost:3000/users/1/send_email)[http://localhost:3000/users/1/send_email]

2. `Liquid`

(http://localhost:3000/users/1/welcome_email)[http://localhost:3000/users/1/welcome_email]
(http://localhost:3000/posts/1)[http://localhost:3000/posts/1]

Now run http://localhost:3000 in your browser. It will show list of users, click
on `send email` link for any users and it should show email in browser new tab.

### actionmailer-markdown

I have used `users_controller` as a demo for `actionmailer-markdown`.
check `users/index.html` where you can find link for `send email`.

which then calls, `UserMailer.activation_email` method.

```ruby
  # mailer/user_mailer.rb
  class UserMailer < ApplicationMailer
    def activation_email(user)
      @name = user.name
      @activation_url = user_url(user.id)
      mail to: user.email
    end
  end

  # config/locales/en.yml
  en:
  user_mailer:
    activation_email:
      subject: Activate your account
      body: |
        Hello, %{name}!

        without blah

        You have to [activate your account](%{activation_url}).

        Thanks,

        --
        Myapp team
```


### shopify/liquid

I am using `posts_controller.rb` for testing `liquid`. ALSO using `RedCloth` for 
parsing html body.

```ruby
  # views/posts/show.html.erb
  <%=raw RedCloth.new(Liquid::Template.parse(@post.content).render('post' => @post)).to_html %>
```

Check `views/possts/untitled.rhtml` for example body where you can find dynamic
contents like:

```ruby
....

<ul id="products">
  {% for product in post.products %}
    <li>
      <h4>{{ product.name }}</h4>
      Only {{ product.price | price }}

      {{ product.description | prettyprint | paragraph }}
    </li>
  {% endfor %}
</ul>

....
```

Also check `models/category.rb`, `models/post.rb` and `models/products.rb` for 
liquid `drop` method for example: `liquid_methods`.

### liquid mailer

I have also used liquid for mailer, similar to `actionmailer-markdown`. For that check

```ruby
# mailer/user_mailer.rb
class UserMailer < ApplicationMailer
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

# views/user_mailer/welcome_email.html.erb
<%=raw RedCloth.new(Liquid::Template.parse(@content).render('name' => @name, 'activation_url' => @activation_url)).to_html %>

```
