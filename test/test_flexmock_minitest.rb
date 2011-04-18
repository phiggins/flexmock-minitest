require 'flexmock/minitest'

class TestMock
  def self.foo
    42
  end
end

class TestFlexmockMinitest < MiniTest::Unit::TestCase
  def test_flexmock_stubbing_works_with_minitest
    flexmock(TestMock).should_receive(:foo => 43)

    assert_equal 43, TestMock.foo
  end

  def test_flexmock_expectations_work_with_minitest
    flexmock(TestMock).should_receive(:foo).never

    TestMock.foo

    assert_raises MiniTest::Assertion do
      flexmock_verify
    end
  end
end

describe MiniTest::Spec do
  it "works with flexmock stubbing" do
    flexmock(TestMock).should_receive(:foo => 43)

    assert_equal 43, TestMock.foo
  end

  it "works with flexmock expectations" do
    flexmock(TestMock).should_receive(:foo).never

    TestMock.foo

    assert_raises MiniTest::Assertion do
      flexmock_verify
    end
  end
end
