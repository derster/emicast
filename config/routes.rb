Rails.application.routes.draw do

  devise_for :admins

  as :admin do
  	get "/login" => "devise/sessions#new"

  	get "/registration" => "devise/registrations#new"
  end

  root 'welcome#index'

  resources :emissions
  
end
