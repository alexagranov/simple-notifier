require 'helper'
require 'example/error'
require 'shoulda'
require 'shoulda-matchers'

class TestErrorNotifier < Test::Unit::TestCase
  context "the test error notifier" do
    subject { "TestErrorNotifier" }

=begin
  should "log to the Rails log if ErrorNotifier notifies on a String" do
    flunk "hey buddy, you should probably rename this file and start testing for real"
  end
=end
    
    should "send an email when ErrorNotifier notifies on an Exception" do
      Notifier::Error.configure(:recipients=>["alex@morphogenic.net"], :from=>"notifier@morphogenic.net")
      Notifier::Error.notify!(Exception.new("Notifying on Exception!"))
    end
    
    should have_sent_email.with_subject(/Notifying on Exception!/)
  end
end
