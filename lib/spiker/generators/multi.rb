# frozen_string_literal: true

require "thor/group"
module Spiker
  module Generators
    # Generates multiple spike files, seperating tests from the
    # tested code.  For when the spike gets too hairy for a single
    # file.
    class Multi < Thor::Group
      include Thor::Actions

      argument :name, type: :string
    end
  end
end
