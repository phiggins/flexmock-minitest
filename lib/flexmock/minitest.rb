require 'minitest/unit'
require 'flexmock/base'

VERSION = "1.0.0"

class FlexMock
  @framework_adapter = Module.new do
    extend MiniTest::Assertions

    def assertion_failed_error
      MiniTest::Assertion
    end
    extend self
  end
end

MiniTest::Unit::TestCase.class_eval do
  include FlexMock::MockContainer

  alias flexmock_minitest_teardown teardown
  def teardown
    flexmock_teardown
    flexmock_minitest_teardown
  end
end

MiniTest::Spec.class_eval do
  after do
    flexmock_teardown
  end
end
