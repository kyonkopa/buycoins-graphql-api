module Types
  class PriceCalculationType < Types::BaseEnum
    value "sell", value: :sell, description: "Calculation is based on sell"
    value "buy", value: :buy, description: "Calculation is based on sell"
  end
end
