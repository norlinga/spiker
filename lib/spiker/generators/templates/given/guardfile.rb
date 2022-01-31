# frozen_string_literal: true

clearing :on

guard :minitest, all_after_pass: true, test_folders: ["."], test_file_patterns: "*.rb" do
  # We're using Minitest's Spec syntax, loaded by Given.
  # We don't have to watch for spec files through because
  # we're using a single file, which is also the app file.
  watch(/^app\.rb$/) { "./app.rb" }
end
