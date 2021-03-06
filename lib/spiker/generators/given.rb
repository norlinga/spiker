# frozen_string_literal: true

require "thor/group"
require_relative "../../spiker"

module Spiker
  module Generators
    # Generates a single spike file, with supporting infrastructure.
    # For simpler spikes that don't need a ton of organization.
    class GivenOption < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def self.source_root
        "#{File.dirname(__FILE__)}/templates/given"
      end

      def create_spike_directory
        empty_directory(name)
      end

      def create_spike_file
        opts = { name_as_class: Spiker.classify(name) }
        template("app.rb.erb", "#{name}/app.rb", opts)
      end

      def create_guard_file
        template("guardfile.rb", "#{name}/Guardfile")
      end

      def create_gem_file
        template("gemfile.rb", "#{name}/Gemfile")
      end

      def create_env_file
        template("../common/basic.env", "#{name}/.env")
      end

      def run_bundler
        inside(name) do
          run("bundle install")
        end
      end
    end
  end
end
