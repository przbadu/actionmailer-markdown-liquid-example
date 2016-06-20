class ApplicationMailer < ActionMailer::Base
  default from: "Identity Server <server@freewheeler.com>",
          reply_to: "Identity Support <support@freewheeler.com>"
  layout 'mailer'
end
