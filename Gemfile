source 'http://rubygems.org'

gem 'rails', '3.2.8'
gem 'rake', '0.8.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'globalize3'

gem 'devise' # Devise must be required before RailsAdmin
gem 'rails_admin'

gem 'jquery-rails'

group :development, :test do
  gem 'ruby-debug19'
end

# Needed for the new asset pipeline
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

# jQuery is the default JavaScript library in Rails 3.1
gem 'jquery-rails'

group :development do
  gem 'capistrano', :require => false
  gem 'capistrano-ext', :require => false
  gem 'rvm-capistrano', :require => false
  gem 'capistrano_colors', :require => false
  gem 'brightbox'

  gem 'rb-fsevent', :require => false
  gem 'growl'
end

group :development, :test do
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'guard-bundler'
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem 'shoulda-matchers'
end

#gem 'therubyracer', :require => false

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
