Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :end_users, only: [:show,:edit,:update,:destroy]
  namespace :admins do
    resources :items
    resources :end_users
  end
  get 'end_users' => 'end_users#leave'
end
