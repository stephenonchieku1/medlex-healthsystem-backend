Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    resources :health_programs, only: [:index, :show, :create, :update, :destroy]
    
    resources :clients, only: [:index, :show, :create, :update] do
      collection do
        get :search
      end
      resources :enrollments, only: [:index]
    end
    
    resources :enrollments, only: [:create, :show, :update]
  end
end
