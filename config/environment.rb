# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.default_url_options = { host: 'localhost:3000' }
