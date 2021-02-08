Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/sign_up' , to: 'users#new'
  get '/users/profile/:id' , to: 'users#profile'
  patch '/users/profile/:id' , to: 'users#profile_edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/posts/my_index' , to: 'posts#my_index'
  get '/posts/show/:id' , to: 'posts#show'
  post '/posts/show/:id' , to: 'reservations#create'
  resources :users
  resources :posts
  resources :reservations
end
