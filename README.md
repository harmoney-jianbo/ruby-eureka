# Ruby::Eureka

[![Build Status](https://travis-ci.org/harmoney-jianbo/ruby-eureka.svg?branch=master)](https://travis-ci.org/harmoney-jianbo/ruby-eureka)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_eureka'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-eureka

Create YAML config files config/eureka_sidecar.yml

    ---
    eureka:
      service_name: service-a
      url: http://localhost:8761/eureka/
    service:
      port: 3000 (Optional default to 3000)
    sidecar:
      port: 9091 (Optional default to 9090)
      instance_id: service-a:9091 (Optional, required when register multiple instances of the same service)

Run the bundle exec command from the application root directory

    bundle exec sidecar

## Usage

Register Ruby application with Eureka server

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby-eureka. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby::Eureka project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby-eureka/blob/master/CODE_OF_CONDUCT.md).
