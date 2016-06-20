if Rails.env.production?
  ActionMailer::Base.delivery_method = :postmark
  ActionMailer::Base.postmark_settings = {
    api_token: ENV['POSTMARK_API_TOKEN'],
  }
end
