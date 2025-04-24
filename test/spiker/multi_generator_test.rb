# frozen_string_literal: true

require "test_helper"
require "fileutils"
require "tmpdir"

class MultiGeneratorTest < Minitest::Test
  def test_generates_multi_spike_structure # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    Dir.mktmpdir do |tmpdir|
      spike_name = "my_spike"
      spike_path = File.join(tmpdir, spike_name)

      generator = Spiker::Generators::Multi.new([spike_name], {}, destination_root: tmpdir)
      generator.shell = SilentShell.new
      generator.invoke_all

      assert File.exist?(File.join(spike_path, "lib/#{spike_name}.rb"))
      # this test shows that boilerplate is generated along with evaluated code
      assert File.read(File.join(spike_path, "lib/#{spike_name}.rb")).include?("class MySpike")

      assert File.exist?(File.join(spike_path, "test/#{spike_name}_test.rb"))
      # this test shows that boilerplate is generated along with evaluated code
      assert File.read(File.join(spike_path,
                                 "test/#{spike_name}_test.rb")).include?("class MySpikeTest < Minitest::Test")
    end
  end
end
