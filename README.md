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
  provider :trezor, hosticon: "https://image.url"
end
```

Or, in a Sinatra app:

```ruby
use OmniAuth::Builder do
  provider :trezor, hosticon: 'https://example.com/icon.png'
end

post '/auth/trezor/callback' do
  auth = request.env['omniauth.auth]
  # Use the auth info
end
```

### Options

These are the options you can specify that are relevant to Omniauth Trezor:

Challenge-response authentication via TREZOR. To protect against replay attacks, you must use a server-side generated and randomized challenge_hidden for every attempt. You can also provide a visual challenge that will be shown on the device.

* `:visual_challenge` - Text that will be shown on the device (defaults to `Time.now.strftime("%Y-%m-%d %H:%M:%S")`)
* `:hidden_challenge` - Hidden randomized hex string used to protect agains replay attacks (defaults to `SecureRandom.hex(32)`)
* `:hosticon` - Optional site icon https url. Should be at least 48x48px.

### Callback phase

After successful authentication `request.env['omniauth.auth'].extra` contains all data that was used to verify the signature: `visual_challenge`, `hidden_challenge`, `signature` and `public_key` for your additional needs (ie. audit log).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kraxnet/omniauth-trezor.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
