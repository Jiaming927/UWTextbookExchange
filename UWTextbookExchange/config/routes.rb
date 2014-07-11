Rails.application.routes.draw do  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup'}
  devise_scope :user do
    get 'resend', :to => 'devise/confirmations#new'
    get 'passreset', :to => 'devise/passwords#new'  
  end
  
  root :to => "init#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
  match "*path", to: redirect("/"), via: :all
end
