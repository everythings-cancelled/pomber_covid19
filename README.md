# PomberCovid19

This gem provides an adapter to allow individuals to recieve Covid19 Data from a given country provided by [this repo] (https://github.com/pomber/covid19).  It shoots GET request to the following URL: 

`https://pomber.github.io/covid19/timeseries.json`.  

The Gem then takes in a country/region that you are looking for and returns data in the following format:

```
[
    {
      "date": "2020-1-22",
      "confirmed": 2,
      "deaths": 0,
      "recovered": 0
    },
    {
      "date": "2020-1-23",
      "confirmed": 3,
      "deaths": 0,
      "recovered": 0
    }
]
```
Where each JSON hash represents the Covid19 data for a given day.

If the request to the Covid19 URL fails, an `HttpRequestError` is raised.  If the region is not found, a `RegionNotFoundError` is raised.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pomber_covid19'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pomber_covid19

## Usage

Simply type `PomberCovid19.find_by_region_name(<region name>)`.  E.g. `PomberCovid19.find_by_region_name("Canada")`.  To get the most recent Covid19 data, do `PomberCovid19.find_by_region_name(<region name>).last` 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everythings_cancelled/pomber_covid19. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PomberCovid19 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the Code of Conduct (which is coming soon).
