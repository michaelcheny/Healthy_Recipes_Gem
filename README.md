# HealthyRecipes

Welcome to Healthy Recipes! This command line application is to let users select healthy recipes based on the category of the dish. Healthy Recipes scrapes `http://www.whfoods.com/index.php` recipe page for over 500 recipes. When the application is first launched, the user will be asked to enter anything to let the program know to continue to the main menu. Once in, the user can follow the prompts to navigate the program. This program was meant to be as user-friendly as possible.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'healthy_recipes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install healthy_recipes


Users can also `git clone` this gem into their directory of choice.

## Usage

`cd` into the main folder of `Healthy_Recipes`

`bin/healthy_recipes` to start the application.

Follow the prompts on screen to navigate within the application.

Enter `Q` anytime to quit.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/healthy_recipes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HealthyRecipes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/healthy_recipes/blob/master/CODE_OF_CONDUCT.md).
