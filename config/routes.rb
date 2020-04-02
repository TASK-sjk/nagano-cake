Rails.application.routes.draw do
  get 'top' => 'homes#top'
  root "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  get 'home/thanks' => 'homes#thanks', as: 'thanks'
  get 'order/info' => 'orders#info', as: 'info'
  get 'customer/hide' => 'customers#hide', as: 'customer/hide'

  namespace :admins do
    resource :customers, only:[:index, :edit, :show]
    resource :categories, only:[:index]
    resource :items, only:[:index, :show]
    resource :orders, only:[:index, :show]
  end

  resource :customers, only:[:edit, :show, :update]
  resources :addresses, only:[:index, :create, :new, :edit, :update, :destroy]
  resources :orders, only:[:index, :create, :new, :show]
  resources :cart_items, only:[:index, :create, :new, :destroy]
  resources :categories, only:[:index, :create, :new, :edit, :update, :destroy]
  resources :items

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
