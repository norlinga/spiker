# frozen_string_literal: true

require_relative "spiker/version"

module Spiker
  class Error < StandardError; end

  def self.constantize(str)
    str.split("_").map(&:capitalize).join
  end
end
