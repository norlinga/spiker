require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class <%= Spiker.constantize(name) %>Test < Minitest::Test
  def test_that_it_works
    assert true
  end
end

class <%= Spiker.constantize(name) %>
  attr_accessor :name
  def initialize(name:)
    @name = name
  end
end
