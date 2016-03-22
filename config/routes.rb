Rails.application.routes.draw do
  get "/", to: 'brands#index', as: :home
  resources(:brands, only: :index) do
    resources :models, only: :index
  end
end
