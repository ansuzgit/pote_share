Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/sign_up' , to: 'users#new'
  resources :users
end
