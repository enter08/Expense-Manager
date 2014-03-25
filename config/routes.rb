Expman::Application.routes.draw do
  devise_for :users

  get 'expenses/statistics'
  resources :expenses

  get 'categories/customize'
  resources :categories do
      put :score, on: :collection
  end

  root to: 'high_voltage/pages#show', id: 'homepage'
  #match '/delete', to: 'expenses#destroy', via: 'delete'

end