# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
# require the default lib file
require "<%= config[:name_in_snake_case] %>"

require "minitest/autorun"
require "minitest/reporters"
require "dotenv/load"

Minitest::Reporters.use!

# ensure the environment is available
class DefaultEnvironmentTest < MiniTest::Test
  def test_default_environment
    assert_equal "test", ENV.fetch("TEST_VALUE", nil)
  end
end
