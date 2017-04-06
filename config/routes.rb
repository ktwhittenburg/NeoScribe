Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
