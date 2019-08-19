Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
        get '/most_revenue', to: 'top_revenue_items#index'
        get '/most_items', to: 'top_sold_items#index'
      end
      
      resources :items, only: [:index, :show] do
        get "/invoice_items", to: 'items/invoice_items#index'
        get "/merchant", to: 'items/merchants#show'
        get '/best_day', to: 'items/days#show'
      end
    end
  end
end
