=begin rdoc
  The notifier gem offers a simple framework for type-based notification events.

  Working much like ActionMailer, this base class simply adds a method_missing implementation to child classes that allows delegation of calls to
  'notify!(object_or_class, params...)' to a method in the child class named after the class type of the first parameter.  

  Concrete sub-classes should implement a method named after the class type of the document being notified on - with the convention that the method 
  name is all downcase with '::' replaced with '_'.

  For an example, see Notifier::Error in the /example directory.
=end
module Notifier
  class Base

    private_class_method :new

    class << self

      # allow child class to only respond_to the dynamic method names that we will add/support below...
      def respond_to?(method_symbol, include_private = false) #:nodoc:
        matches_dynamic_method?(method_symbol) || super
      end

      # override method_missing for child classes so that our list of dynamically added method names are recognized.  if a particular
      # dynamically added method name is called, do the appropriate action.  For instance, if calling 'notify!', delegate to a method named
      # after the type of the first passed parameter...
      def method_missing(method_symbol, *parameters) #:nodoc:
        if match = matches_dynamic_method?(method_symbol)
          case match[1]
            when 'notify!':
              # support for notifying on Class types rather than just instances...
              if parameters[0].class == Class
                method_to_call = parameters[0].to_s.downcase.gsub(/::/,"_")
              else
                method_to_call = parameters[0].class.to_s.downcase.gsub(/::/,"_")
              end
              new(method_to_call).send!(*parameters)
            when 'new'     then nil
            else super
          end
        else
          super
        end
      end

      private

      # our list of supported dynamic method names on child classes...(note these are to be called at class-level)
      def matches_dynamic_method?(method_name) #:nodoc:
        method_name = method_name.to_s
        /^(notify!)$/.match(method_name) || /^(new)$/.match(method_name)
      end

    end

    def initialize(method_name=nil, *parameters)
      create!(method_name) if method_name
    end

    def create!(method_name)
      initialize_defaults(method_name)
    end

    def send!(*parameters)
      __send__(@type_method, *parameters)
    end

    private
      # Set up any default values
      def initialize_defaults(method_name)
        @type_method ||= method_name
      end

  end
end

