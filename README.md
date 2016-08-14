# Vitals::RiemannReporter

The Riemann Reporter allows [Vitals](https://github.com/jondot/vitals) to send metrics to Riemann instead of StatsD.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vitals-riemann_reporter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vitals-riemann_reporter

## Usage

Initialise Vitals with a RiemannReporter instead of the StatsdReporter:

```
require 'vitals'
Vitals.configure! do |c|
  c.reporter = Vitals::Reporters::RiemannReporter.new(host: 'riemann-host', port: 5555)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ben-M/vitals-riemann_reporter.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

