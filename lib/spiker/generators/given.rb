# frozen_string_literal: true

module Spiker
  module Generators
    # Generates a single spike file, with supporting infrastructure.
    # For simpler spikes that don't need a ton of organization.
    class Given < BaseGenerator
      def create_spike_file
        opts = { name_as_class: Spiker.classify(spike_name) }
        template("#{generator_name}/app.rb.tt", "#{spike_name}/app.rb", opts)
      end
    end
  end
end
