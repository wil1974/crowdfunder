source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
 gem 'thin'
  gem 'better_errors'  #Only use in Development, Dont use in Production as it is high risk
  gem 'quiet_assets'  #Shuts off assets request messages in Rails
  gem 'meta_request'  #require the chrome extension as well https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg
  gem 'awesome_print'
  gem 'rack-mini-profiler'  #gem must be inserted after pg gem.
  # https://github.com/flyerhzm/bullet
  # gem 'bullet'  #alert you to N+1 queries
  #
  #
  #https://github.com/cldwalker/hirb
  #Hirb is a rails console thing, used for tabular output of tables.

  #run rails_best_practices -f HTML .
  gem "rails_best_practices"
  #run rubocop -R app -o rubocop-error.txt
  gem 'rubocop', require: false

  #generate ERD diagrams - cmd: rake erd
  #http://rails-erd.rubyforge.org/customise.html
  gem "rails-erd"
end


group :production do
  gem 'rails_12factor'
  gem 'puma', '~> 2.16.0'
end

gem 'bootstrap-sass', '~> 3.3.6'
# gem 'jquery-turbolinks'
# https://github.com/maxim/bootswatch-rails
gem 'bootswatch-rails'
# https://github.com/bokmann/font-awesome-rails
gem 'font-awesome-rails'
# gem 'rename'
# gem 'masonry-rails'
# gem "carrierwave", :github => "carrierwaveuploader/carrierwave"
# gem 'mini_magick'
# gem 'fog-aws'
#bundle exec figaro install
# gem 'figaro'
# gem 'bootstrap-will_paginate'
gem 'devise'
#https://github.com/herval/yahoo-finance
# gem 'yahoo-finance'

# gem 'jquery-ui-rails'

# https://github.com/plataformatec/simple_form
gem 'simple_form'

#https://github.com/CanCanCommunity/cancancan
#https://www.sitepoint.com/cancancan-rails-authorization-dance/
# gem 'cancancan', '~> 1.10'

#https://github.com/thoughtbot/paperclip
# gem "paperclip"
# gem 'aws-sdk', '< 2.0'
# gem 'aws-sdk', '>= 2.0.34'

#https://github.com/norman/friendly_id
# gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

#Stripe gem
# gem 'stripe'

#State Machine for tracking transaction
#https://github.com/aasm/aasm
# gem 'aasm'

#zdennis/activerecord-import
#activerecord-import is a library for bulk inserting data using ActiveRecord.
#speed improvement thru reducing SQL statments.
#example, active record of about 4M SQL insert statements vs 3 using active-import,
#which results in vastly improved performance. In our case, it converted an 18 hour batch process to <2 hrs.
#gem 'activerecord-import'


# Place this at the bottom of the Gemfile
# as recommened by Newrelic docs
# visit localhost:3000/newrelic for performance stats
# gem 'newrelic_rpm'


