# OmniAuth AccountKit

Account Kit strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-accountkit'
```

Then `bundle install`

## Usage

Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's an example:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :accountkit, ENV["ACCOUNTKIT_APP_ID"], ENV["ACCOUNTKIT_APP_SECRET"]
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/polydice/omniauth-accountkit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
