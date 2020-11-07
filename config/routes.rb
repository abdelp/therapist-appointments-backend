Rails.application.routes.draw do
<<<<<<< HEAD
  namespace :api, :path => "", :constraints => {:subdomain => "api"} do
    namespace :v1 do
      resources :users do
        resources :appointments
      end

      post '/login', to: 'users#login'
      get '/auto_login', to: 'users#auto_login'

      resources :therapists do
        resources :appointments
      end
    end
  end
=======
  resources :users, only: %i[create] do
    resources :appointments, only: %i[create index show]
  end

  post '/login', to: 'users#login'

  resources :therapists, only: %i[index show]
>>>>>>> e9da0b28e1cba8973fe666a85827be06aef5ce3b
end
