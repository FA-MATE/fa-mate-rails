Rails.application.routes.draw do
  resources :post_images
  resources :post_conditions
  resources :user_conditions
  resources :post_tags
  resources :conditions
  resources :posts
  resources :tags
  resources :condition_groups
  resources :sub_categories
  resources :categories do
    member do
      get 'sub_categories', format: 'json'
    end
  end
  resources :tag_groups
  resources :users do
    collection do
      get 'me', format: 'json'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
