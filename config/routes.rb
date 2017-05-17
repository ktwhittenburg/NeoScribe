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
  #special projects routing
  post '/users/:user_id/projects/new' => 'projects#create'
  patch '/users/:user_id/projects/:id/edit' => 'projects#update'
  put '/users/:user_id/projects/:id/edit' => 'projects#update'
  #special trials routing
  post '/projects/:project_id/trials/new' => 'trials#create'
  patch '/projects/:project_id/trials/:id/edit' => 'trials#update'
  put '/projects/:project_id/trials/:id/edit' => 'trials#update'
  
  resources :users do
	resources :projects, :name_prefix => "user_"
  end
  resources :projects do
    resources :trials, :name_prefix => "project_"
  end
  resources :trials do
  	get 'run', on: :member
	post 'run', on: :member
	patch 'run', on: :member
	resources :behavior, :name_prefix => "trial_"
  end
  
  resources :behavior

  #end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
