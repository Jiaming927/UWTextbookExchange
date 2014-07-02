Rails.application.routes.draw do
  devise_for :users

  root :to => "init#index"

  #get '/signup' => "init#signup"
  #root 'init#index'
  match "init/create",
	:to => "init#create",
	:via => :get
  match ':controller(/:action(/:id))', :via => [:get, :post]

end
