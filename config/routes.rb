Rails.application.routes.draw do
  devise_for :users
  root "welcomes#home"
  get "home", to: "welcomes#home"
  get "about", to: "welcomes#about"
end
