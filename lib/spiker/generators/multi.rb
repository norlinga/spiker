# frozen_string_literal: true

require "thor/group"
require_relative "../../spiker"

module Spiker
  module Generators
    # Generates multiple spike files, seperating tests from the
    # tested code.  For when the spike gets too hairy for a single
    # file.
    class Multi < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def self.source_root
        "#{File.dirname(__FILE__)}/templates"
      end

      def create_spike_directories
        empty_directory(name)
        empty_directory("#{name}/lib")
        empty_directory("#{name}/test")
      end

      def create_test_files
        name_in_snake_case = Spiker.snake_case(name)
        name_as_class = Spiker.classify(name)
        opts = { name_as_class: name_as_class, name_in_snake_case: name_in_snake_case }
        template("multi_app_test.rb.erb", "#{name}/test/#{name_in_snake_case}_test.rb", opts)
        template("multi_test_helper.rb", "#{name}/test/test_helper.rb", opts)
      end

      def create_app_files
        name_in_snake_case = Spiker.snake_case(name)
        opts = { name_as_class: Spiker.classify(name) }
        template("multi_app.rb.erb", "#{name}/lib/#{name_in_snake_case}.rb", opts)
      end

      def create_guard_file
        template("multi_guardfile.rb", "#{name}/Guardfile")
      end

      def create_gem_file
        template("multi_gemfile.rb", "#{name}/Gemfile")
      end

      def create_rake_file
        template("multi_rakefile.rb", "#{name}/Rakefile")
      end

      def create_readme_file
        opts = { name_as_class: Spiker.classify(name), name: name }
        template("multi_readme.md.erb", "#{name}/README.md", opts)
      end

      def create_env_file
        template("basic.env", "#{name}/.env")
      end

      def run_bundler
        inside(name) do
          run("bundle install")
        end
      end
    end
  end
end
