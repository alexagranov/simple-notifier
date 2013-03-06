require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "simple-notifier"
  gem.homepage = "http://github.com/alexagranov/simple-notifier"
  gem.license = "MIT"
  gem.summary = %Q{Allows one to create notification handlers for any type of object.}
  gem.description = %Q{Inspired by ActionMailer, Notifier offers Notifier::Base, a base class for creating notification handlers on any class or instance of a class.  Simply define a method in your handler named after the type of object you would like to create notification events for, substituting any namespace "::" delineation with "_", along with a signature that allows for the object as the first parameter and an optional params hash.  Then notify on that object or class by simply calling MyHandler.notify!(myclass, params).}
  gem.email = "alex@morphogenic.net"
  gem.authors = ["Alex Agranov"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.add_development_dependency 'actionmailer', '~> 2.0'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.ruby_opts << "-I\"./examples\""
end

if RUBY_VERSION < '1.9'
require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "notifier #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
