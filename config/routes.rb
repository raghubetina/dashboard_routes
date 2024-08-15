Rails.application.routes.draw do
  resources :runs, only: [:show] do
    member do
      namespace :instructor do
        resource :dashboard, only: :show do
          resources :users, only: [:index, :show] # Overview of accesses, roles, etc
          resources :units, only: [:index, :show] # Modify global and per-learner weights, due dates, etc
          resources :grades, only: [:index, :show] # Detailed grade breakdown, descriptive statistics, alerts for learners falling behind
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
