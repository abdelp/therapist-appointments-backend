Rails.application.routes.draw do
  resources :users do
    resources :appointments
  end
end
