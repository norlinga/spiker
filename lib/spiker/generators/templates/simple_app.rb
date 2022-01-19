require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class <%= config[:name_as_class] %>Test < Minitest::Test
  def test_that_it_works
    assert true
  end
end

class <%= config[:name_as_class] %>
  attr_accessor :name
  def initialize(name:)
    @name = name
  end
end
