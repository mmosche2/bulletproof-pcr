if ENV['GMAIL_USERNAME'] && ENV['GMAIL_PASSWORD']
  ActionMailer::Base.smtp_settings = {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :domain               => 'mail.gmail.com',
    :user_name            => ENV['GMAIL_USERNAME'],
    :password             => ENV['GMAIL_PASSWORD'],
    :authentication       => :plain,
    :enable_starttls_auto => true
  }
  ActionMailer::Base.delivery_method = :smtp
end