# frozen_string_literal: true

require "thor/group"
require_relative "../../spiker"

module Spiker
  module Generators
    # Generates a single spike file, with supporting infrastructure.
    # For simpler spikes that don't need a ton of organization.
    class Simple < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def self.source_root
        "#{File.dirname(__FILE__)}/templates"
      end

      def create_spike_directory
        empty_directory(name)
      end

      def create_spike_file
        opts = { name_as_class: Spiker.classify(name) }
        template("simple_app.rb", "#{name}/app.rb", opts)
      end

      def create_guard_file
        template("simple_guardfile.rb", "#{name}/Guardfile")
      end

      def create_gem_file
        template("simple_gemfile.rb", "#{name}/Gemfile")
      end

      def run_bundler
        inside(name) do
          run("bundle install")
        end
      end
    end
  end
end
