Rails.application.routes.draw do
  get 'sessions/new'
  resources :admins
  resources :users
  
  root 'static_pages#home'
  get 'help'    =>  'static_pages#help'
  get 'about'   =>  'static_pages#about'
  get 'contact' =>  'static_pages#contact'

  get 'signup'=> 'users#new'
  get 'users/new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'application#hello'
  # get  'static_pages/home', to: "static_pages#hi"   
  # get  'static_pages/help'   
  
end
