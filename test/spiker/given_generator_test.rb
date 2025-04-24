# frozen_string_literal: true

require "test_helper"
require "fileutils"
require "tmpdir"

class GivenGeneratorTest < Minitest::Test
  def test_generates_given_spike_structure
    Dir.mktmpdir do |tmpdir|
      spike_name = "my_spike"
      spike_path = File.join(tmpdir, spike_name)

      generator = Spiker::Generators::Given.new([spike_name], {}, destination_root: tmpdir)
      generator.shell = SilentShell.new
      generator.invoke_all

      assert File.exist?(File.join(spike_path, "app.rb"))
      # this test shows that boilerplate is generated along with evaluated code
      assert File.read(File.join(spike_path, "app.rb")).include?("describe \"When Initializing a MySpike")
    end
  end
end
