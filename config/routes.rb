Rails.application.routes.draw do
  get 'top' => 'homes#top'
  root "homes#top"

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  get 'home/about' => 'homes#about', as: 'about'
  get 'home/thanks' => 'homes#thanks', as: 'thanks'
  get 'order/info' => 'orders#info', as: 'info'
  # 変更
  # get 'customer/hide' => 'customers#hide', as: 'customer/hide'
  put 'customers/hide' => 'customers#hide', as: 'customers/hide'
  # 追加
  get 'customers/leave' => 'customers#leave', as: 'customers/leave'

  get 'search' => 'admins#search', as: 'search'

  namespace :admins do
    get 'admins/top' => 'admins#top', as: 'top'
    # 検索結果表示画面の追加
    resources :customers, only:[:index, :edit, :show]
    resources :categories, only:[:index, :edit, :create, :update]
    resources :items, only:[:index, :show, :new, :edit, :create, :update]
    resources :orders, only:[:index, :show]
  end

  resource :customers, only: :show
  patch 'customer' => 'customers#update', as: 'customer/update'
  put 'customer' => 'customers#update'
  # editのURLがdeviseのregistrations edit のURLと被ってしまうので変更
  get 'customer/edit' => 'customers#edit', as: 'customer/edit'
  resources :addresses, only:[:index, :create, :new, :edit, :update, :destroy]
  resources :orders, only:[:index, :create, :new, :show]
  resources :cart_items, only:[:index, :create, :new, :destroy]
  resources :items


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
