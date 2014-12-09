require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  namespace :api ,defaults: {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:create,:show,:update,:destroy]
      resources :clockwork_events, only: [:index,:create,:show,:update,:destroy] do
        resources :pain_ratings, only: [:index]
      end
    end
  end

  root "application#index"

  post 'webhooks/reminder' => 'webhooks#reminder'
  post 'webhooks/log_pain' => 'webhooks#log_pain'

end
