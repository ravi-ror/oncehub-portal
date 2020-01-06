Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :expenses


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'recover-password' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', :to => "static#index"
  get 'about', :to => "static#about"
  get 'faqs', :to => "static#faqs"
  get 'leave-policies', :to => "leaves#policies"
  root :to => "static#index"

  devise_scope :user do
    get 'profile', :to => "users#profile"
    get 'edit-profile', :to => "users#edit_profile"

    # Chat functionality
    get 'private-chat-rooms', to: 'chat_rooms#index'
    resources :chat_rooms, only: [:new, :create, :show, :index]

    # get 'create-retro', to: 'retros#create_retro'
    # resources :retros, only: [:show]

    # Pointing poker
    resources :pointing_pokers, only: [:new, :create, :show, :index]

    # Retros
    resources :retros, only: [:new, :create, :show, :index]
  end
  resources :teams
  resources :users
  resources :inspirational_quotes


  # root :to => 'chat_rooms#index'

  mount ActionCable.server => '/cable'
end
