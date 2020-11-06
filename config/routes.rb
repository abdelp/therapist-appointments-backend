Rails.application.routes.draw do
  resources :users, only: %i[create] do
    resources :appointments, only: %i[create index show]
  end

  post '/login', to: 'users#login'

  resources :therapists, only: %i[index show]
end
