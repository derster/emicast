Rails.application.routes.draw do

  devise_for :admins

  get '/dashboard' => 'emissions#dashboard', as: 'dashboard'

  get '/episodes' => 'welcome#episodes', as: 'episodes'

  resources :emissions do
  	resources :episodes
	collection do
      get 'search'
    end
  end

  resources :categories


  root 'welcome#index'
  
end