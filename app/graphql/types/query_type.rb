module Types
  class QueryType < Types::BaseObject
    field :calculate_price, Float, null: false do
      argument :type, PriceCalculationType, required: true
      argument :margin, Float, required: true
      argument :exchange_rate, Float, required: true
    end

    def calculate_price(type:, margin:, exchange_rate:)
      # get current price of bitcoin in usd
      current_usd_price = Api::CoinDesk.new.current_usd

      if type == :sell
        markup = ((100 - margin) * current_usd_price)/100
      elsif type == :buy
        markup = ((100 + margin) * current_usd_price)/100
      end

      # convert to NGN
      price = exchange_rate*markup

      price.round 2
    end
  end
end
