# frozen_string_literal: true

require "thor"
require_relative "version"
require_relative "generators/simple"
require_relative "generators/given"
require_relative "generators/multi"

module Spiker
  # Accept options "simple", "given", or "multi".
  # Both Simple and Given create "single file" spikes
  # with the tests and spike code in a single file.
  # The Multi option creates a more traditionally structured
  # spike directory with tests, code, README, etc.  That is all.
  class CLI < Thor
    desc "version", "Show version"
    def version
      puts "Spiker version #{Spiker::VERSION}"
    end

    desc "simple NAME", "Spike in a single file"
    method_option :name, type: :string, aliases: "-n", desc: "Name of the spike"
    def simple(name)
      Spiker::Generators::Simple.start([name])
    end

    desc "given NAME", "Spike in a single file using Given syntax"
    method_option :name, type: :string, aliases: "-n", desc: "Name of the spike"
    def given(name)
      Spiker::Generators::GivenOption.start([name])
    end

    desc "multi NAME", "Spike over multiple files"
    method_option :name, type: :string, aliases: "-n", desc: "Name of the spike"
    def multiple(name)
      Spiker::Generators::Multi.start([name])
    end
  end
end
