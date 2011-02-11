# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simple-notifier}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Agranov"]
  s.date = %q{2011-02-11}
  s.description = %q{Inspired by ActionMailer, Notifier offers Notifier::Base, a base class for creating notification handlers on any class or instance of a class.  Simply define a method in your handler named after the type of object you would like to create notification events for, substituting any namespace "::" delineation with "_", along with a signature that allows for the object as the first parameter and an optional params hash.  Then notify on that object or class by simply calling MyHandler.notify!(myclass, params).}
  s.email = %q{alex@morphogenic.net}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "example/error.rb",
    "example/notifier/error/emailer/error_notification.erb",
    "lib/notifier.rb",
    "lib/notifier/base.rb",
    "simple-notifier.gemspec",
    "test/helper.rb",
    "test/test_error_notifier.rb"
  ]
  s.homepage = %q{http://github.com/alexagranov/simple-notifier}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Allows one to create notification handlers for any type of object.}
  s.test_files = [
    "test/helper.rb",
    "test/test_error_notifier.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<actionmailer>, ["~> 2.0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<actionmailer>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<actionmailer>, ["~> 2.0"])
  end
end

