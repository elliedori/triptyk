# Bands Example App

> **Note**: The branch contains an example app built with DBC's Sinatra skeleton. If you're building a new app or challenge, you'll probably want to use the [master](/../../tree/master) branch, which doesn't include any example models, controllers, views or tests.

### Purpose

1. Provides an example implementation of basic CRUD functionality, using the DBC Sinatra skeleton.
2. Demonstrates that it is not **required** that all models in `app/models` be
   `ActiveRecord` backed!
3. Includes a suite of RSpect tests that demonstrate unit, controller and integration testing.

### Quickstart

1.  `bundle install`
2.  `rake db:create`
3.  `rake db:migrate`
4.  `rake db:seed`
5.  `shotgun config.ru`
6.  Open [http://localhost:9393/bands](http://localhost:9393/bands)

#### Running Tests
**Note**: Be sure to run `rake db:test:prepare` before running tests.

To run the entire suite of tests: `rspec`

To run a specific example: `rspec spec/band_spec.rb`


### Contributing

We would love for you to help make the skeleton more awesome, There are three ways to contribute:

1. Ask for a bug fix or enhancement!
2. Submit a pull request for a bug fix or enhancement!
3. Code review an open pull request!

Be prepared to give and receive specific, actionable, and kind feedback!
