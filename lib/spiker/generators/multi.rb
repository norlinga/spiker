# frozen_string_literal: true

module Spiker
  module Generators
    # Generates multiple spike files, seperating tests from the
    # tested code.  For when the spike gets too hairy for a single
    # file.
    class Multi < BaseGenerator
      def create_additional_spike_directories
        empty_directory("#{spike_name}/lib")
        empty_directory("#{spike_name}/test")
      end

      def create_app_files
        template("#{generator_name}/app.rb.tt",
                 "#{spike_name}/lib/#{multi_options[:name_in_snake_case]}.rb", multi_options)
      end

      def create_test_files
        template("#{generator_name}/app_test.rb.tt",
                 "#{spike_name}/test/#{multi_options[:name_in_snake_case]}_test.rb", multi_options)
        template("#{generator_name}/test_helper.rb.tt", "#{spike_name}/test/test_helper.rb", multi_options)
      end

      def create_rake_file
        template("#{generator_name}/Rakefile.tt", "#{spike_name}/Rakefile")
      end

      def create_readme_file
        template("#{generator_name}/README.md.tt", "#{spike_name}/README.md", multi_options)
      end

      private

      def multi_options
        @multi_options ||= {
          name_as_class: Spiker.classify(spike_name),
          name_in_snake_case: Spiker.snake_case(spike_name)
        }
      end
    end
  end
end
