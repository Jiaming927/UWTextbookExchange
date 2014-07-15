Rails.application.routes.draw do  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup'}
  devise_scope :user do
    get 'resend', :to => 'devise/confirmations#new'
    get 'passreset', :to => 'devise/passwords#new'  
  end

  resources :messages

  match 'find', to: 'get_book#find', :via => [:get, :post]
  match 'show', to: 'get_book#show', :via => [:get]
  match 'post', to: 'get_book#post', :via => [:get]
  match 'postto', to: 'get_book#postto', :via => [:get]
  
  match 'personal', to: 'init#personal', :via => [:get]
  match 'terms', to: 'init#terms', :via => [:get]
  match 'traded', to: 'init#traded', :via => [:get]
  match 'unlist', to: 'init#unlist', :via => [:get]
  match 'resume', to: 'init#resume', :via => [:get]
  match 'delete', to: 'init#delete', :via => [:get]

  root :to => "init#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
  match "*path", to: redirect("/"), via: :all
end
