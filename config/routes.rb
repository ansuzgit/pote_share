Rails.application.routes.draw do
  root 'static_pages#home'
  get '/sign_up' , to: 'users#new'
  get '/users/profile/:id' , to: 'users#profile'
  patch '/users/profile/:id' , to: 'users#profile_edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
