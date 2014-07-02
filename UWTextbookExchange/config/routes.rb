Rails.application.routes.draw do
  devise_for :users

  root :to => "init#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]

end
