Rails.application.routes.draw do
  root 'home#index'
  get '/:screen_name', to: 'home#index'
end
