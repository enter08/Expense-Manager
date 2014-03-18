Expman::Application.routes.draw do
  devise_for :users
  resources :expenses
  #get 'expenses/mdate'
  resources :category, only: [:index, :show]
  root to: 'high_voltage/pages#show', id: 'homepage'
  #match '/delete', to: 'expenses#destroy', via: 'delete'
end