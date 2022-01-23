# frozen_string_literal: true

clearing :on

guard :minitest, all_after_pass: true, test_folders: ["."], test_file_patterns: "*.rb" do
  # with Minitest::Unit
  watch(/^app\.rb$/) { "./app.rb" }
end
