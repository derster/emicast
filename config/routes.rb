Rails.application.routes.draw do

  devise_for :admins

  get '/dashboard' => 'emissions#dashboard', as: 'dashboard'


  resources :emissions do
  	resources :episodes
  end

  resources :categories


  root 'welcome#index'
  
end