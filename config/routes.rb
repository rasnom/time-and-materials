Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#show'

  resources :pay_periods, only: [:index, :show]

  resources :timesheets, only: [:index, :show, :edit, :update]

end
