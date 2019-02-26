Rails.application.routes.draw do
  # get 'dashboard/all_bookings'
  # get 'dashboard/all_flats'

  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :edit, :update ]
  # resources :bookings, only: [:index ]

  resources :flats do
    resources :bookings, only: [ :new, :create ]
  end
  # dashboard/bookings or dashboard/flats ..all_bookings for path in navbar "My Bookings"
  get '/dashboard/bookings', to: 'dashboard#all_bookings', as: 'all_bookings'
  get '/dashboard/flats', to: 'dashboard#all_flats', as: 'all_flats'
end
