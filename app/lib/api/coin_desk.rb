require 'open-uri'
require 'json'

module Api
  class CoinDesk

    def initialize
      # this is for us to easily switch out our api client
      @client = URI
      @BASE_ENDPOINT = 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'
    end

    def endpoint
      @BASE_ENDPOINT
    end

    def fetch
      response = @client.open(endpoint).read # returns json response
      data = JSON.parse(response)
    end

    def current_usd
      fetch['bpi']['USD']['rate_float']
    end
  end
end

