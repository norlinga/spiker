# Spiker

Spiker scaffolds small, testable Ruby experiments — *spikes*. It generates a
working red-green setup (Minitest or RSpec, plus Guard) in seconds, so you can
validate an idea or explore an API without writing boilerplate first.

Think of it as `rails new` for code spikes.

[![Gem Version](https://badge.fury.io/rb/spiker.svg)](https://badge.fury.io/rb/spiker)

## Installation

```sh
gem install spiker
```

## Usage

Navigate to wherever you keep your experiments and create a spike:

```sh
spiker simple my_idea
cd my_idea
```

Then start Guard and work in a red-green loop:

```sh
bundle exec guard
```

## Spike Types

### `simple`

All code and tests in one file. Good for one-off ideas or sharing snippets.

```sh
spiker simple my_idea
```

Generates:

```
my_idea/
├── app.rb
├── Gemfile
├── Guardfile
├── .env
├── Dockerfile*
├── docker-compose.yml*
├── Makefile*
```

\* Skippable — see [Options](#options).

The `app.rb` file includes a starter class, a few tests, and support for
`.env` values:

```ruby
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class MyIdeaTest < Minitest::Test
  def test_name
    assert_equal "Fred", MyIdea.new(name: "Fred").name
  end

  def test_default_env_value
    assert_equal "test", ENV["TEST_VALUE"]
  end
end

class MyIdea
  attr_accessor :name

  def initialize(name:)
    @name = name
  end
end
```

### `given`

Like `simple`, but uses `Minitest::Spec` with Given/When/Then style tests.
Inspired by the late, great Jim Weirich.

```sh
spiker given my_given_spike
```

### `multi`

A multi-file layout for spikes that need more structure. Minitest is the test
framework, Rake is wired up, and Guard watches your files.

```sh
spiker multi cool_tool
cd cool_tool
```

Generates:

```
cool_tool/
├── lib/cool_tool.rb
├── test/
│   ├── test_helper.rb
│   └── cool_tool_test.rb
├── Guardfile
├── Gemfile
├── Rakefile
├── README.md
```

### `rspec`

Like `multi`, but with RSpec.

```sh
spiker rspec spike_it
cd spike_it
```

Generates:

```
spike_it/
├── lib/spike_it.rb
├── spec/
│   ├── spec_helper.rb
│   └── spike_it_spec.rb
├── Guardfile
├── Gemfile
├── Rakefile
```

Run tests with `bundle exec guard`, `rake`, or `rspec`.

## Options

Each generator supports flags to skip pieces you don't need:

```sh
spiker simple my_spike --skip-docker --skip-bundle --skip-git
```

Run `spiker help` or `spiker help [COMMAND]` to see all options.

## Why Spiker?

- **Fast** — from idea to testable code in seconds, no boilerplate by hand
- **Familiar** — Minitest, RSpec, Guard, Rake: tools you already know
- **Simple** — no configuration or meta-generators
- **Docker-ready** — edit locally, run in a container if you like
- **Flexible** — pick the spike format that fits the task

## Development

Spiker is a generator-style Ruby gem built on Thor. To add a new spike type,
work in:

```sh
lib/spiker.rb
lib/spiker/cli.rb
lib/spiker/generators/<YOUR_GENERATOR_HERE>
lib/spiker/templates/<YOUR_GENERATOR_TEMPLATES_HERE>
```

Adapting an existing spike type only requires changes to the last two.

To get started, check out the repo and run `bundle exec bin/setup` to install
dependencies. Run `rake test` to run the tests, or `bundle exec bin/console`
for an interactive prompt. To install your local version of the gem, run
`bundle exec rake install`. For everything else, see `bundle exec rake -T`.

## License

Spiker is open source, released under the [MIT License](LICENSE.txt).

[https://github.com/norlinga/spiker](https://github.com/norlinga/spiker)
