Rails.application.routes.draw do
  get 'seats/index'
  get 'routes/index'
  get 'routes/new'
  get 'routes/show'
  get 'buses/index'
  get 'buses/new'
  
  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  root "buses#index"
  resources :routes do
    resources :buses, only: [:new, :create]
  end

  resources :buses, only: [:index, :show, :new, :create] do
    resources :seats, only: [:show, :new, :create, :edit, :update]
  end

  resources :seats 

  resources :reservations, only: [:index, :new, :show, :create, :edit, :update] do
    get "accept"
    get "reject"
  end 

  resources :welcomes
  get "home", to: "welcomes#home"
  get "contact", to: "welcomes#contact"
  get "about", to: "welcomes#about"
  
end
