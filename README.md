RSpec Rails Seed
===================

This is a seed project which demonstrates how to use RSpec with Guard /Capybara to unit test Rails projects.
CI is done using Travis.

How to run:
-------------------

`bundle exec rspec`

Steps to reproduce from beginning.

```
# to setup Rails and omit Ruby Test::Unit framework since we are using RSpec
rails new geo_pictures --skip-test-unit

```

Add following to Gemfile
```
gem 'rspec-rails', :group => [:test, :development]

# run bundle install
bundle install

# to prepare RSpec for use with Rails
rails generate rspec:install
```
