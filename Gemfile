source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'bson_ext', '1.6.1'
gem 'mongoid', :git => 'git://github.com/mongoid/mongoid.git'
gem 'jquery-rails'
gem 'backbone-on-rails'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.0.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
# http://techiferous.com/2010/04/using-capybara-in-rails-3/
group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'minitest'
  gem 'minitest-rails', git: 'https://github.com/rawongithub/minitest-rails.git', branch: 'gemspec'
  gem 'capybara'
  gem 'turn'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
end


group :development do
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
  # Use unicorn as the web server
  gem 'unicorn'
end


group :deployment do
  # Deploy with Capistrano
  gem 'capistrano'
end
