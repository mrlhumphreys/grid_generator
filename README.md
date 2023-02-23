# GridGenerator

Library for generating grids based on twisty puzzles. The output can be used in svg `polygon` and `line` elements.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add grid_generator 

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install grid_generator 

## Usage

Generate an iso grid at co-ordinates 20, 20, with each unit being 20.

Squares arguments are csv-like with commas separating elements and newlines separating rows.

Each element can be a colour, represented by a letter, or blank, represented by a dash.

```
grid = GridGenerator.iso_view(x: 20, y: 20, units: 20, top_squares: "-,-,-\\n-,-,R\\n-,-,W", front_squares: "-,-,R\\n-,b,-\\n-,b,-", right_squares: "B,B,-\\n-,r,-\\n-,r,-")
```

Serialized the data for use in svg polygon and line elements: 

```
grid.as_json
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrlhumphreys/grid_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mrlhumphreys/grid_generator/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GridGenerator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mrlhumphreys/grid_generator/blob/main/CODE_OF_CONDUCT.md).
