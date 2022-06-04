Rails.application.routes.draw do
  resources :admins
  resources :users
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/ho'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'application#hello'
  # get  'static_pages/home', to: "static_pages#hi"   
  # get  'static_pages/help'   
  root 'application#hello'
end
