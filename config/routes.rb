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
  get '/posts/show/:post_id' , to: 'posts#show'
  post '/posts/show/:post_id' , to: 'reservations#create'
  get '/my_reservations' , to: 'reservations#index'
  
  resources :users
  resources :posts  , shallow: true do
    resources :reservations
  end
  
  get '/static_pages/home' , to: 'posts#index'
end
