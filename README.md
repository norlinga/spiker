# 🧪 Spiker

**Spiker** helps you spin up quick, testable Ruby experiments, aka *spikes*.
Whether you're validating an idea, poking at a new API, or just noodling with some code, Spiker gives you a clean, red-green workflow in seconds.

It’s like `rails new` for code spikes.

[![Gem Version](https://badge.fury.io/rb/spiker.svg)](https://badge.fury.io/rb/spiker)

---

## 🚀 Install

Get Spiker the same way you get any other Ruby gem:

```sh
gem install spiker
```

---

## 🛠️ Use It

Navigate to wherever you keep your brilliant ideas:

```sh
cd ~/spikes
```

Then create your first Spiker-flavored spike:

```sh
spiker simple my_rad_idea
cd my_rad_idea
```

Start coding. Run tests. Celebrate small wins. 🎉

---

## 🧬 Spike Types

Spiker gives you different formats depending on your mood:

### `simple`

All code and tests in **one file**. Perfect for one-off ideas or sharing snippets with others.

```sh
spiker simple my_rad_idea
```

Generates:

```
my_rad_idea/
├── app.rb
├── Gemfile
├── Guardfile
├── .env
├── Dockerfile*
├── docker-compose.yml*
├── Makefile*
```

\* Skippable via `--skip-docker`, `--skip-bundle`, etc.

The `app.rb` file includes your class, a few tests, and support for `.env` values:

```ruby
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class MyRadIdeaTest < Minitest::Test
  def test_name
    assert_equal "Fred", MySpike.new(name: "Fred").name
  end

  def test_default_env_value
    assert_equal "test", ENV["TEST_VALUE"]
  end
end

# your brilliance goes here
class MyRadIdea
  attr_accessor :name

  def initialize(name:)
    @name = name
  end
end
```

Start Guard and hack away:

```sh
bundle exec guard
```

---

### `given`

Like `simple`, but with support for `Minitest::Spec` and `Given/When/Then` style tests. Inspired by the late, great Jim Weirich.

```sh
spiker given my_given_spike
```

---

### `multi`

When you need more structure — say you're testing something big, or just like folders.

```sh
spiker multi cool_tool
cd cool_tool
```

You get:

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
...etc
```

Minitest is still the test framework. Rake is wired up. Guard watches your files. You're all set.

---

### `rspec`

Like `multi`, but for people who write `describe` instead of `def test_thing`. 🐹

```sh
spiker rspec spike_it
cd spike_it
```

You’ll get:

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

Just add ideas and run `bundle exec guard` or `rake` or... `rspec`.

---

## ⚙️ Options

Want fewer moving parts?

```sh
spiker simple my_spike --skip-docker --skip-bundle --skip-git
```

Run `spiker help` or `spiker help [COMMAND]` to see all your options.

---

## 💡 Why Use Spiker?

- ✅ Fast: From idea to testable code in seconds and no boring boilerplate by hand
- ✅ Familiar: Minitest, RSpec, Guard, Rake — tools you already know... or want to know
- ✅ Simple: No weird configs or meta-generators
- ✅ Docker-Ready: Write code in your favorite editor, run your code in Docker? Intriguing...
- ✅ Flexible: Choose the spike format that fits your flow

---

## 💪 Development

Spiker is a straightforward "generator"-style Ruby gem.
It uses Thor to handle the bulk of the generator heavy lifting, so it will be straightforward to adapt to your needs.
If you want to make a new style of "spike", you'll work in:

```sh
lib/spiker.rb
lib/spiker/cli.rb
lib/spiker/generators/<YOUR_GENERATOR_HERE>
lib/spiker/templates/<YOUR_GENERATOR_TEMPLATES_HERE>
```

Adapting an existing spike just requires attention to the last two items above.

To get rolling, check out the repo and run `bundle exec bin/setup` to install dependencies.
Then, run `rake test` to run the tests.
You can also run `bundle exec bin/console` for an interactive prompt that will allow you to experiment.

To install your updated version of the gem onto your local machine, run `bundle exec rake install`.
To see what else you can do, there's always `bundle exec rake -T`

---

## 🧼 Fine Print

Spiker is open source, MIT-licensed, and built for fun and function.

Use it. Fork it. Spike responsibly.

→ [https://github.com/norlinga/spiker](https://github.com/norlinga/spiker)
