clearing :on

guard :minitest, all_after_pass: true, test_folders: ['.'], test_file_patterns: '*.rb' do
  # with Minitest::Unit
  watch(%r{^app\.rb$})      { './app.rb' }
end
