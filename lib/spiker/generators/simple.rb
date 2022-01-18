require 'thor/group'
module Spiker
  module Generators
    class Simple < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def create_spike_directory
        empty_directory(name)
      end

      def create_spike_file
        template('simple_app.rb', "#{name}/app.rb")        
      end

      def create_guard_file
        template('simple_guardfile.rb', "#{name}/Guardfile")
      end

      def create_gem_file
        template('simple_gemfile.rb', "#{name}/Gemfile")
      end
    end
  end
end