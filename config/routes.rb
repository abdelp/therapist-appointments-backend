Rails.application.routes.draw do
  resources :users do
    resources :appointments
  end

  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'

  resources :therapists do
    resources :appointments
  end
end
