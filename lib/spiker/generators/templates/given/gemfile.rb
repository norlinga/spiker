# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "minitest"
gem "minitest-reporters"
gem "minitest-given"

gem "guard"
gem "guard-minitest"

gem "dotenv"

gem "rubocop"