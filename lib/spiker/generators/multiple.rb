require 'thor/group'
module Spiker
  module Generators
    class Multiple < Thor::Group
      include Thor::Actions

      argument :name, type: :string
    end
  end
end