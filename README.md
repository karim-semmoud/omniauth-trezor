# omniauth-trezor

`omniauth-trezor` provides an [OmniAuth][omniauth] strategy for [Trezor Connect][trezor_connect].

With this strategy your users can use popular [Bitcoin Trezor][trezor] to login to your website.

[omniauth]: https://github.com/intridea/omniauth
[trezor_connect]: https://github.com/trezor/connect
[trezor]: https://www.bitcointrezor.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-trezor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-trezor

## Usage

In Rails app, add config/initializers/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trezor, "visible challenge", "https://image.url"
end
```

Or, in a Sinatra app:

```ruby
use OmniAuth::Builder do
  provider :trezor, :datetime, 'https://example.com/icon.png'
end

post '/auth/trezor/callback' do
  auth = request.env['omniauth.auth]
  # Use the auth info
end
```

`request.env['omniauth.auth'].extra` contains `visual_challenge`, `hidden_challenge`, `signature` and `public_key`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kraxnet/omniauth-trezor.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
