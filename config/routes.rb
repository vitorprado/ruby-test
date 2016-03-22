Rails.application.routes.draw do
  get '/', to: 'brands#index', as: :home
  get '/models', to: 'models#index', as: :models
end
