Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'buses/index'
  get 'buses/new'

  devise_for :users
  root "buses#index"

  resources :welcomes
  get "home", to: "welcomes#home"
  get "contact", to: "welcomes#contact"
  get "about", to: "welcomes#about"
  
  resources :buses
end
