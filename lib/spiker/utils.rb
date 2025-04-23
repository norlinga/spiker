# frozen_string_literal: true

# methods used in the generators
module Spiker
  def self.classify(str)
    str.split(/[^A-Za-z0-0]/).map(&:capitalize).join
  end

  def self.snake_case(str)
    # lifted from ActiveSupport inflectors
    str.gsub("::", "/")
       .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
       .gsub(/([a-z\d])([A-Z])/, '\1_\2')
       .tr("-", "_")
       .downcase
  end
end
