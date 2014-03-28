Expman::Application.routes.draw do
  devise_for :users

  get 'expenses/statistics'
  get 'expenses/new_income'
  resources :expenses

  get 'categories/customize'
  resources :categories do
      put :score, on: :collection
  end

  resources :locations

  match 'budget_items/create_budget', via: :post
  match 'budget_items/update_budget', via: :patch
  resources :budget_items
  
  #match 'locations', to: 'locations#index', via: :get

  root to: 'high_voltage/pages#show', id: 'homepage'
  #match '/delete', to: 'expenses#destroy', via: 'delete'

end