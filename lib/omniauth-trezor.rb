require "omniauth-trezor/version"
require "omniauth"

module OmniAuth
  module Strategies
    autoload :Trezor,  'omniauth/strategies/trezor'
  end
end
