RSpec Rails Seed
===================
[![Build Status](https://travis-ci.org/donigian/RSpec_Rails_Guard_Capybara_Seed.svg?branch=master)](https://travis-ci.org/donigian/RSpec_Rails_Guard_Capybara_Seed)

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

Writing ActiveRecord specifications 
```
rails g model location latitude:decimal longitude:decimal

# creates databases and then migrates the schema of the default development environment
# also clones the development database structure to the test database
rake db:create:all && rake db:migrate && rake db:test:clone

```

