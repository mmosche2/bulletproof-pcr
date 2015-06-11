if ENV['EMAIL_USERNAME'] && ENV['EMAIL_PASSWORD']
  ActionMailer::Base.smtp_settings = {
    :address              => 'smtp05.sherwebcloud.com',
    :port                 => '587',
    :user_name            => ENV['EMAIL_USERNAME'],
    :password             => ENV['EMAIL_PASSWORD'],
    :authentication       => :login,
    :enable_starttls_auto => true
  }
  ActionMailer::Base.delivery_method = :smtp
end