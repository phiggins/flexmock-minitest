require 'minitest/unit'
require 'flexmock/base'

class FlexMock
  @framework_adapter = Module.new do
    extend MiniTest::Assertions

    def assertion_failed_error
      MiniTest::Assertion
    end
    extend self
  end

  module Minitest
    VERSION = "1.0.0"

    include FlexMock::MockContainer

    def teardown
      super
      flexmock_teardown
    end
  end
end

MiniTest::Unit::TestCase.send(:include, FlexMock::Minitest)

MiniTest::Spec.class_eval do
  after do
    flexmock_teardown
  end
end
