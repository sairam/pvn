source 'http://rubygems.org'

gem 'rails', '3.2.2'

# ERB alternative
gem 'slim'

# Pagination
# gem 'kaminari'

# Authentication
gem 'devise'
# gem 'cancan'

# Better db queries
# gem 'squeel'

# database in production
# gem 'pg'

# database in devo/test
gem 'sqlite3'

# bootstrap - UI
gem 'bootstrap-sass', '~> 2.0.1'

gem 'bundler', '1.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'yui-compressor'
  # js compiler
  gem 'execjs'
  gem 'therubyracer'
end

gem 'newrelic_rpm'
# Default javascript library
gem 'jquery-rails'

gem 'formtastic'
gem 'formtastic-bootstrap'

gem 'client_side_validations'
#gem 'client_side_validations-formtastic'

# use pjax instead of ajax!
# gem 'pjax_rails'

## Views - https://github.com/jcasimir/draper
gem 'draper'


# comments
gem 'acts_as_commentable_with_threading', :git => 'https://github.com/elight/acts_as_commentable_with_threading.git'
# votes
gem 'acts_as_votable'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false

end

group :development do

  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'

  # manage vendor assets
  gem 'vendorer' # https://github.com/grosser/vendorer

  # Hirb - Better viewing of structured data
  gem 'hirb'

  # Pretty Printing
  gem 'awesome_print'

  # Console
  gem 'pry-rails' # for pow
  gem 'map_by_method' # Helper for pry

  # profiler can be used in newrelic page
  # gem 'ruby-prof'

  # Guard
  # gem 'guard-livereload'
  # gem 'guard-bundler'
  #
  # gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  #
  # gem 'rails_best_practices'

end
