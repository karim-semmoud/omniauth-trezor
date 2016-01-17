require 'rubygems'
require 'bundler'

Bundler.setup :default, :development, :example
require 'sinatra'
require 'omniauth'
require 'omniauth-trezor'

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :trezor, hosticon: 'https://example.com/icon.png'
end

get '/' do
  <<-HTML
  <ul>
    <li><a href='/auth/trezor'>Sign in with Trezor</a></li>
  </ul>
  HTML
end

post '/auth/:provider/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].inspect
end
