require 'helper'
require 'example/error'
require 'shoulda'
require 'shoulda-matchers'

class TestErrorNotifier < Test::Unit::TestCase
  context "the test error notifier" do
    subject { "TestErrorNotifier" }

    setup do
      Notifier::Error.configure(:recipients=>["alex@morphogenic.net"], :from=>"notifier@morphogenic.net")
    end

    should "1 send an email when ErrorNotifier notifies on a String message" do
      Notifier::Error.notify!("Please read this important message!")
    end
    
    should "2 send an email when ErrorNotifier notifies on an Exception" do
      Notifier::Error.notify!(Exception.new("Notifying on Exception!"))
    end
    
    should have_sent_email.with_body(/Please read/)
    should have_sent_email.with_subject(/Notifying on Exception!/)
  end
end
