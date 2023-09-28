Rails.application.routes.draw do
  get 'buses/index'
  get 'buses/new'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root "welcomes#home"
  get "home", to: "welcomes#home"
  get "about", to: "welcomes#about"
end
