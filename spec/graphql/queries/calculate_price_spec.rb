require "rails_helper"

RSpec.describe GraphqlController, type: :controller do
  describe 'perform calculate price query' do
    # call api
    let(:coindesk_response) { Api::CoinDesk.new.fetch }

    it 'should fetch bitcoin price in usd' do
      expected = {
        "bpi" => a_hash_including(
          "USD" => 
            a_hash_including("rate_float" => kind_of(Float))
        )
      }

      expect(coindesk_response).to be_kind_of(Hash)
      expect(coindesk_response).to include expected
    end

    context 'when all the right parameters are passed' do
      it 'returns price in NGN' do
        # perform query
        post :execute, params: {query: query(type: :sell, margin: 0.2, exchange_rate: 340.98)}
        expect(gql_response(response, 'calculatePrice')).to be_kind_of(Integer)
      end
    end

    context 'when wrong parameters are passed' do
      it 'should return errors' do
        # perform query
        post :execute, params: {query: query(type: :exchange, margin: 'margin', exchange_rate: nil)}
        expect(gql_response(response, 'calculatePrice', raw: true)["errors"]).to be_truthy #gql_response is a helper defined in rails_helper.rb
      end
    end
  end

  def query(type:, margin:, exchange_rate:)
    # sample query
    <<~GQL
      query calculatePrice {
        calculatePrice(type: #{type}, exchangeRate: #{exchange_rate}, margin: #{margin})
      }
    GQL
  end
end