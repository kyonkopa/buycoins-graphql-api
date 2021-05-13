# README

Simple rails graphql server with one query `calculatePrice`. We make a request to get the current price of bitcoin and do some calculation with it. We then return the price.

**Installation**  
Clone and run `bundle install`

**Implementaion**  
This is graphql api server, queries can be found at `app/graphql/types/query_type.rb`. The calculatePrice query is resolved in `query_type.rb`. The coindesk client can be found at `app/lib/api/coin_desk.rb`. Tests are in `rspec/graphql/queries/calculate_price_spec.rb`.

**Test**  
`rspec`

**Run**  
Visit [hosted app](https://buycoins-graphql-api.herokuapp.com/graphiql) OR run `rails s -p 30001` then hit _localhost:3001/graphiql_
