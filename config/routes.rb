Rails.application.routes.draw do
  get 'seats/index'
  get 'routes/index'
  get 'routes/new'
  get 'routes/show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  root "buses#index"
  get 'buses/index'
  get 'buses/new'
  resources :buses, only: [:index, :show, :new, :create] do
    resources :seats, only: [:show, :new, :create, :edit, :update]
  end
  
  devise_for :users

  resources :welcomes
  get "home", to: "welcomes#home"
  get "contact", to: "welcomes#contact"
  get "about", to: "welcomes#about"
  
  resources :routes do
    resources :buses, only: [:new, :create]
  end
end
