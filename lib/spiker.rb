# frozen_string_literal: true

require "thor"
require "thor/group"

require "spiker/version"
require "spiker/utils"
require "spiker/base_generator"
require "spiker/generators/simple"
require "spiker/generators/given"
require "spiker/generators/multi"
require "spiker/generators/rspec"
require "spiker/cli"

# Spiker is a simple spike generator.
module Spiker
  class Error < StandardError; end
end
