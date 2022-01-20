# frozen_string_literal: true

require_relative "spiker/version"

# Spiker is a simple spike generator.
module Spiker
  class Error < StandardError; end

  def self.classify(str)
    str.split(/[^A-Za-z0-0]/).map(&:capitalize).join
  end

  def self.snake_case(str)
    # lifted from ActiveSupport inflectors
    str.gsub(/::/, "/")
       .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
       .gsub(/([a-z\d])([A-Z])/, '\1_\2')
       .tr("-", "_")
       .downcase
  end
end
