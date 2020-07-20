Rails.application.routes.draw do
  resources :users
  resources :worlds
  resources :characters
 
  root 'world#home'

  devise_for :users, controllers: {registrations: "registrations", omniauth_callbacks: "callbacks"}
 
  devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

end
