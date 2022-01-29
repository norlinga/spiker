# Spiker

Spiker helps you validate your ideas under test.  It can also be a basic educational tool, giving the learner a minimal framework to start writing and testing their Ruby code.

## Installation

[![Gem Version](https://badge.fury.io/rb/spiker.svg)](https://badge.fury.io/rb/spiker)

Install it directly:

    $ gem install spiker

## Usage

In the terminal, change directory to someplace where you want to collect your spikes:

    $ cd ~/spikes

Then, create a new spike:

    $ spiker simple my_spike
    $ cd my_spike

Using the "simple" formula, Spiker will create an `app.rb` file, a `Gemfile`, a `Guardfile` and an `.env` file for configuration, to be read by the `dotenv` gem.  The `app.rb` file will contain boilerplate for both Minitest and a Ruby class in the same file:  

```ruby
require 'dotenv'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'dotenv/load'

Minitest::Reporters.use!

class MySpikeTest < Minitest::Test
  def test_name
    assert_equal "Fred", MySpike.new(name: "Fred").name
  end

  def test_default_env_value
    assert_equal "test", ENV["TEST_VALUE"]
  end
end

class MySpike
  attr_accessor :name
  def initialize(name:)
    @name = name
  end
end
```

From here, the user should be able to start Guard and immediately begin development in a red-green fashion.

The "multi" option places directories and files into a named directory, and is intended to flesh out a more complex spike that includes a tests directory and `test_helper.rb`, a `lib` directory, README.md, etc.  The overall workflow is still the same:

    $ spiker multi my_spike
    $ cd my_spike

Bundle will run automatically and the user will be able to start development in a red-green fashion just the same as with the simple spike.  There is also a Rakefile provided, the Guardfile is modified from the simple version to include files in directories, and simple tests are predefined.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/norlinga/spiker.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
