Expman::Application.routes.draw do
  devise_for :users
  resources :expenses
  root to: 'high_voltage/pages#show', id: 'homepage'
  #match '/delete', to: 'expenses#destroy', via: 'delete'
end