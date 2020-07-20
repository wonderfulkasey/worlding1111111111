Rails.application.routes.draw do
 
  resources :users, only: [:show]
  resources :characters
  resources :worlds do
    resources :characters, only: [:show, :new]
  end
 
  root 'worlds#home'



  devise_for :users, controllers: {registrations: "registrations", 
          omniauth_callbacks: "callbacks"}
 
          devise_scope :user do 
            get 'login', to: 'devise/sessions#new'
        end
      
        devise_scope :user do 
          get 'logout', to: 'devise/sessions#destroy'
        end
      
        devise_scope :user do
          get 'signup', to: 'devise/registrations#new'
        end

end
