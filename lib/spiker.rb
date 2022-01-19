# frozen_string_literal: true

require_relative "spiker/version"

module Spiker
  class Error < StandardError; end

  def self.classify(str)
    str.split(/[^A-Za-z0-0]/).map(&:capitalize).join
  end
end
