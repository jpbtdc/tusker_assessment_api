Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'prospects#index'
  resources :prospects, only: [ :index, :show ] do
    get :next_package
    get :available_packages
  end
  resources :packages, only: [ :index ]
  resources :cities, only: [ :index ]
end
