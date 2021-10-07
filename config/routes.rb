Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'merchants/:merchant_id/dashboard', to: 'merchants#dashboard'
  resources :merchants, only: [] do
    member do
      get 'dashboard'
    end
  end
end
