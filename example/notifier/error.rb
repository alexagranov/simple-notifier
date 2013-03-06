=begin rdoc
  This is an Error notifier.

  Create a <object_type> method for each object type you would like to handle notification via the 'notify!(<object>, <params>...)' method.
=end
module Notifier
  class Error < Notifier::Base

=begin rdoc
  A method to configure the Error Notifier.

  :recipients => <array of email addresses to receive email notifications>
  :from => <email address to be used for the From: field of email notification>
=end
    def self.configure(opts={})
      @@recipients = opts[:recipients]
      @@from = opts[:from]
    end

    def self.recipients
      @@recipients
    end

    def self.from
      @@from
    end

=begin rdoc
  Notification handler for Exception.  Called via Notifier::Error.notify!(exception).

  Currently, use an internal ActionMailer class to send out an email to the error recipients list about potential problems.
=end
    def exception(exception, opts={})
      opts[:body] = exception.message + "\n"
      opts[:body] += exception.backtrace.join("\n") unless exception.backtrace.nil?
      Emailer.deliver_error_notification(exception.message, opts)
    end

=begin rdoc
  Notification handler for String.  Called via Notifier::Error.notify!("some error msg").

  Currently, use an internal ActionMailer class to send out an email to the error recipients list about potential problems.
=end
    def string(msg, opts={})
      opts[:body] = msg
      Emailer.deliver_error_notification(msg, opts)
    end

    private

    class ConfigurationError < StandardError
    end

    class Emailer < ActionMailer::Base
      self.template_root = File.dirname(__FILE__)
      self.delivery_method = :test

      def error_notification(error_msg, opts={})
        raise ConfigurationError.new("Failed to call Notifier::Error.configure with :recipients and/or :from") if Notifier::Error.recipients.nil? or Notifier::Error.from.nil?
        recipients Notifier::Error.recipients.join(",")
        from       Notifier::Error.from
        subject    error_msg
        body       :body => opts[:body]
      end
    end

  end
end

