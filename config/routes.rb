Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get '/about', to: 'static_pages#about'
  get  '/help', to: 'static_pages#help'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/users/:user_id/projects/new' => 'projects#create'
  patch '/users/:user_id/projects/:id/edit' => 'projects#update'
  put '/users/:user_id/projects/:id/edit' => 'projects#update'
  resources :users do
	resources :projects do
	  resources :trials
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
