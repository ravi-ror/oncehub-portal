Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'recover-password' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', :to => "static#index"
  root :to => "static#index"

  devise_scope :user do
    get 'profile', :to => "users#profile"
    get 'edit-profile', :to => "users#edit_profile"
  end
  resources :users
  resources :inspirational_quotes
end
