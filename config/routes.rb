Nccu2hand::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # root :to => 'high_voltage/pages#show', :id => 'welcome'
  root :to => 'items#index'
  match '/dashboard' => 'items#dashboard' 
  
  resources :items

  resources :relationships, only: [:create, :destroy]
end
