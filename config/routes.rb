Rails.application.routes.draw do
  root 'projects#index', as: 'home'
  
  devise_for :users
  
  resources :projects do
    resources :tasks
  end
end
