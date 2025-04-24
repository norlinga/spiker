# frozen_string_literal: true

ENV["SPIKER_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "spiker"

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!

require "thor"

# In order to suppress Thor output in tests, we create
# a custom shell class that overrides the methods
# responsible for printing to the console.
class SilentShell < Thor::Shell::Basic
  def say(*); end
  def say_status(*); end
  def print_table(*); end
  def print_wrapped(*); end
  def file_collision(*) = :overwrite
end
