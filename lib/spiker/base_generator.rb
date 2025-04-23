# frozen_string_literal: true

module Spiker
  # BaseGenerator handles the common steps for all generators, including allowing for
  # several feature skips. Inherited this generator - not to be used directly.
  class BaseGenerator < Thor::Group
    include Thor::Actions

    argument :spike_name, type: :string

    def self.source_root
      File.expand_path("../spiker/templates", __dir__)
    end

    def generator_name
      # name here refers to the class name, not the name of the spike
      name = self.class.name.split("::").last
      name.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
    end

    def create_spike_directory
      empty_directory(spike_name)
    end

    def create_guard_file
      template("#{generator_name}/Guardfile.tt", "#{spike_name}/Guardfile")
    end

    def create_gem_file
      template("#{generator_name}/Gemfile.tt", "#{spike_name}/Gemfile")
    end

    def create_env_file
      template("common/basic.env.tt", "#{spike_name}/.env")
    end

    def create_docker_files
      if options[:skip_docker]
        say "🛑 Skipping Dockerfile and docker-compose.yml generation (--skip-docker was passed)", :yellow
        return if options[:skip_docker]
      end

      template("common/Dockerfile.tt", "#{spike_name}/Dockerfile")
      template("common/docker-compose.yml.tt", "#{spike_name}/docker-compose.yml")
      template("common/Makefile.tt", "#{spike_name}/Makefile")
    end

    def run_bundle_install
      if options[:skip_bundle]
        say "🛑 Skipping bundle install (--skip-bundle was passed)", :yellow
        return
      end

      inside(spike_name) do
        gemfile_path = File.expand_path("Gemfile")
        env = { "BUNDLE_GEMFILE" => gemfile_path }

        say "📦 Running bundler with BUNDLE_GEMFILE=#{gemfile_path}", :blue
        system(env, "bundle install")
      end
    end

    def run_git_init
      if options[:skip_git]
        say "🛑 Skipping git init (--skip-git was passed)", :yellow
        return
      end

      say "📦 Running `git init`...", :green
      inside(File.join(destination_root, spike_name)) { run "git init" }
    end
  end
end
