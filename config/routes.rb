Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/:screen_name', to: 'home#index'
end
