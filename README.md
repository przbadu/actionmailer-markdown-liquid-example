Test Actionmailer-markdown and shopify/liquid
______________________________________________

### Development setup

    $ bundle install
    $ rake db:migrate db:seed
    $ rails s

Now run http://localhost:3000 in your browser. It will show list of users, click
on `send email` link for any users and it should show email in browser new tab.
