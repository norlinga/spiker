# frozen_string_literal: true

require "test_helper"

class SpikerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Spiker::VERSION
  end

  def test_classify
    assert_equal "FooBarBaz", Spiker.classify("foo_bar_baz")
    assert_equal "FooBarBaz", Spiker.classify("foo-bar-baz")
  end
end
