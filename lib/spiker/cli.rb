# frozen_string_literal: true

module Spiker
  # Accept options "simple", "given", "multi", or "rspec".
  # Both Simple and Given create "single file" spikes
  # with the tests and spike code in a single file.
  # The Multi and Rspec options create a more traditionally structured
  # spike directory with tests, code, README, etc.  That is all.
  class CLI < Thor
    class_option :skip_bundle, type: :boolean, default: false, desc: "Skip running bundle install"
    class_option :skip_git, type: :boolean, default: false, desc: "Skip initializing git repository"
    class_option :skip_docker, type: :boolean, default: false, desc: "Skip creating Dockerfile and docker-compose.yml"

    desc "version", "Show version"
    def version
      puts "Spiker version #{Spiker::VERSION}"
    end

    desc "simple NAME", "Spike in a single file"
    def simple(spike_name)
      Spiker::Generators::Simple.new([spike_name], generator_options).invoke_all
    end

    desc "given NAME", "Spike in a single file using Given syntax"
    def given(spike_name)
      Spiker::Generators::Given.new([spike_name], generator_options).invoke_all
    end

    desc "multi NAME", "Spike using Minitest over multiple files"
    def multi(spike_name)
      Spiker::Generators::Multi.new([spike_name], generator_options).invoke_all
    end

    # TODO: Implement Rspec generator
    # desc "rspec NAME", "Spike using Rspec over multiple files"
    # def rspec(name)
    #   Spiker::Generators::Rspec.start([name])
    # end

    private

    def generator_options
      {
        skip_bundle: options[:skip_bundle],
        skip_git: options[:skip_git],
        skip_docker: options[:skip_docker]
      }
    end
  end
end
