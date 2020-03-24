Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :end_users, only: [:show,:edit,:update,:destroy]
  resources :items, only: [:show,:index]
  resources :cart_items, only: [:update,:index,:destroy,:create]
  resources :orders, only: [:new,:create]
  get 'orders/done' => 'orders#done'
  get 'orders/confirm' => 'orders#confirm'
  namespace :admins do
    resources :items
    resources :end_users
    resources :orders
  end
  resources :addresses, only: [:index,:create,:update,:destroy,:edit]
  resources :orders_details, only: [:create]
  get 'end_users' => 'end_users#leave'
  delete 'cart_items' => 'cart_items#destroy_all'
end
