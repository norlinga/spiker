# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
# require the default lib file
require "<%= name_in_snake_case %>"

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!
