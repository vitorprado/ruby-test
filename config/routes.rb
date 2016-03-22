Rails.application.routes.draw do
  get "/" => "home#index", as: 'home'

  get "/models" => "models#index"
end
