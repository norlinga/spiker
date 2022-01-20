# frozen_string_literal: true

require 'test_helper'

class <%= name_as_class %>Test < MiniTest::Unit::TestCase
  def test_default_class_instantiates
    assert <%= name_as_class %>.new
  end

  def test_default_class_responds_to_hello
    assert_equal "Hello, world!", <%= name_as_class %>.hello
  end
end