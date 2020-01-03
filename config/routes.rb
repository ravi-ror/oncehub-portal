Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', :to => "static#index"
  root :to => "static#index"

  devise_scope :user do
    get 'profile', :to => "user#profile"
    get 'edit-profile', :to => "user#edit_profile"
    get 'login', to: 'devise/sessions#new'
    get 'recover-password', to: 'devise/passwords#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  resources :user
end
