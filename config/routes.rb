Rails.application.routes.draw do
  namespace :admin do
    resources :post_images
    resources :post_conditions
    resources :user_conditions
    resources :post_tags
    resources :conditions
    resources :posts
    resources :tags
    resources :condition_groups
    resources :sub_categories
    resources :categories
    resources :tag_groups
    resources :users
  end
  
  resources :app_data, only: [:index]

  resources :posts do
    member do
      post 'like'
    end
  end

  resources :users do
    collection do
      get 'me'
      put 'me/notification_settings', to: 'users#notificaiton_settings'
      post 'me/devices', to: 'users#devices'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # 廃止予定
  resources :sub_categories
  resources :categories do
    member do
      get 'sub_categories'
    end
  end
  resources :conditions
  resources :tags
  resources :condition_groups
  resources :tag_groups
end
