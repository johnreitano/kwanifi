require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'



  resources :todo_lists, only: [] do

    member do
      patch :postpone
    end
  end

  resources :todo_items do
    member do
      patch :toggle_complete
    end
  end

  root to: 'pages#home'
  get 'pages/home'
  get '/landing', to: 'pages#landing'
  get '/easy-steps', to: 'pages#easy_steps'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
