# frozen_string_literal: true

require 'test_helper'

class <%= config[:name_as_class] %>Test < MiniTest::Unit::TestCase
  def test_default_class_instantiates
    assert <%= config[:name_as_class] %>.new
  end

  def test_default_class_responds_to_hello
    assert_equal "Hello, world!", <%= config[:name_as_class] %>.hello
  end
end