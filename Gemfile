source 'https://rubygems.org'

gem 'rails', '3.2.13'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'

end

group :production do
   gem 'pg'
   gem 'rails_stdout_logging' 
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  #gem 'simplecov', :require => false
end

gem 'jquery-rails'
gem 'debugger', :group => :development
gem 'bcrypt-ruby', '~> 3.0.0'
