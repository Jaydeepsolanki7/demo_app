Rails.application.routes.draw do
  get 'seats/index'
  get 'routes/index'
  get 'routes/new'
  get 'routes/show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'buses/index'
  get 'buses/new'

  resources :buses
  devise_for :users
  root "buses#index"

  resources :welcomes
  get "home", to: "welcomes#home"
  get "contact", to: "welcomes#contact"
  get "about", to: "welcomes#about"
  
  resources :routes do
    resources :buses
  end
end
