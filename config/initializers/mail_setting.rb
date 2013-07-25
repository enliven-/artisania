ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true


ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  user_name:            'artisania.help@gmail.com',
  password:             'artisaniahelp',
  authentication: "plain",
  enable_starttls_auto: true
}

ActionMailer::Base.default_url_options[:host] = "artisania.herokuapp.com"