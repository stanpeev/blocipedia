if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['app36987482@heroku.com'],
    password:       ENV['eo4vyiot2488'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end