source 'https://rubygems.org'

ruby "2.0.0"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Add Foundation Here
gem "compass-rails" # you need this or you get an err
gem 'zurb-foundation'
# and the icons
gem 'foundicons-rails'
#and the flash helper!
#gem 'foundation_rails_helper'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#for testing
group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'newrelic_rpm' #for monitoring and keeping the webstie alive
  # for creating the documents in the background instead of making the user wait
  gem "delayed_job_active_record"
  gem "workless", "~> 1.1.3"
  gem "daemons"
end

group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'email_spec' #some tests for emails 
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

gem 'devise' #login/sign up


# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'google-api-client' #for google drive access and create docs
gem 'google_drive' #for obtaining human readable link on drive docs

gem 'jquery-ui-rails' #date picker for step 7

