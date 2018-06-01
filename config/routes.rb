Rails.application.routes.draw do
  get 'exchanges/bittrex'
  
  root 'exchanges#bittrex'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
