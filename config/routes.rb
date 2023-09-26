Rails.application.routes.draw do
  root "welcomes#home"
  get "home", to: "welcomes#home"
end
