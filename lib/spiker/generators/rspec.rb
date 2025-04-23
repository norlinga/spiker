# frozen_string_literal: true

module Spiker
  module Generators
    # Generates multiple spike files, seperating specs from the
    # tested code.  For when the spike gets too hairy for a single
    # file.
    class Rspec < BaseGenerator
      def create_additional_spike_directories
        empty_directory("#{spike_name}/lib")
        empty_directory("#{spike_name}/spec")
      end

      def create_app_files
        template("#{generator_name}/app.rb.tt",
                 "#{spike_name}/lib/#{spec_options[:name_in_snake_case]}.rb", spec_options)
      end

      def create_test_files
        template("#{generator_name}/app_spec.rb.tt",
                 "#{spike_name}/spec/#{spec_options[:name_in_snake_case]}_spec.rb", spec_options)
        template("#{generator_name}/spec_helper.rb.tt", "#{spike_name}/spec/spec_helper.rb", spec_options)
      end

      def create_rake_file
        template("#{generator_name}/Rakefile.tt", "#{spike_name}/Rakefile")
      end

      def create_readme_file
        template("#{generator_name}/README.md.tt", "#{spike_name}/README.md", spec_options)
      end

      private

      def spec_options
        @spec_options ||= {
          name_as_class: Spiker.classify(spike_name),
          name_in_snake_case: Spiker.snake_case(spike_name)
        }
      end
    end
  end
end
