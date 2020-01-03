Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'recover-password' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', :to => "static#index"
  root :to => "static#index"

  devise_scope :user do
    get 'profile', :to => "user#profile"
    get 'edit-profile', :to => "user#edit_profile"
  end
  resources :user
end
