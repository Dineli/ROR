Rails.application.routes.draw do
  resources :event
#  , :path =>"eVeNtZ"
  
  root 'event#home'
  
  get 'eventz' => "event#home", as: :home 
  get 'eventz/contact' => "event#contact", as: :contact 
  get 'eventz/list' => "event#index", as: :index
#  get 'eventz/info' => "event#show", as: :show

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
