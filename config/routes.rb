Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  root 'contacts#index'

  resources :contacts

  get '/login' => 'sessions#new' , as: :login
  get '/logout' => 'sessions#destroy' , as: :logout
  post '/sessions' => 'sessions#create' , as: :sessions
  get '/sessions' => 'sessions#new'
  
end
