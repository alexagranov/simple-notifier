source "http://rubygems.org"

gem 'rake'
gem 'bundler'
gem 'jeweler'

group :test do
  gem 'shoulda'
  gem "actionmailer", "~> 2.0"
  if RUBY_VERSION < '1.9'
    gem 'rcov'
  else
    gem 'simplecov'
  end
end
