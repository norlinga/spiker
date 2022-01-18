# frozen_string_literal: true

require "thor"
require 'spiker/generators/simple'
require 'spiker/generators/multiple'

module Spiker
  # Accept options "single" and "multiple"
  # for single file spikes or multi-file spikes
  # and a name for the spike directory.  That is all
  class CLI < Thor
    desc "version", "Show version"
    def version
      puts "Spiker version #{Spiker::VERSION}"
    end

    desc "simple", "Spike in a single file"
    method_option :name, type: :string, aliases: "-n", desc: "Name of the spike"
    def simple(name)
      Spiker::Generators::Simple.start([name])
    end

    desc "multiple", "Spike over multiple files"
    method_option :name, type: :string, aliases: "-n", desc: "Name of the spike"
    def multiple(name)
      Spiker::Generators::Multiple.start([name])
    end
  end
end
