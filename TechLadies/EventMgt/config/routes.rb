Rails.application.routes.draw do
  resources :event
  
  root 'event#home'
  
  get 'eventz' => "event#home", as: :home 
  get 'eventz/contact' => "event#contact", as: :contact 
  get 'eventz/list' => "event#index", as: :index

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
