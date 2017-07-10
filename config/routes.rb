Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users , :controllers => { :registrations => "user/registration"}
  resources :user_stocks, except: [:edit, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root  'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'

  get 'stock_search', to: 'stocks#search'
end
