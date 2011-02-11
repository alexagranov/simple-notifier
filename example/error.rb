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
  Add a generic handler for Exception which allows us to call Notifier::Error.notify!(exception).

  Currently, use an internal ActionMailer class to send out an email to the error recipients list about potential problems.
=end
    def exception(exception, opts={})
      opts[:body] = exception.message + "\n" # + exception.backtrace.join("\n")
      Emailer.deliver_error_notification(exception.message, opts)
    end

=begin rdoc
  Add a generic handler for String which allows us to call Notifier::Error.notify!("some error msg").

  Currently, just log to error log.
=end
    def string(msg, opts={})
      Rails.logger.error msg
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

