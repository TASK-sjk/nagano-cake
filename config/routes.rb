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

  namespace :admins do
    get '/top' => 'admins#top', as: 'top'
    # namespaceの外にあったので、中に移動
    get 'search' => 'admins#search', as: 'search'
    patch 'customers/:id/update' => 'customers#update', as: 'update'
    put 'customers/:id/update' => 'customers#update'
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
  resources :orders, only:[:index, :create, :show]
   get 'order/confirm' => 'order#confirm', as: 'order/confirm'
  resources :cart_items, only:[:index, :create, :new, :destroy, :update] do
   collection do
    delete 'destroy_all'
   end
  end
  resources :items
  resources :order_items, only:[:create, :index]
  post 'orderitem' => 'order_items#create', as: 'orderitem/create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
