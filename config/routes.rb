Rails.application.routes.draw do

  mount_roboto
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :admin do
    resources :user, only: [:new, :create, :index]
  end

  namespace :user do
    ################
    # User profile
    ########
    resources :profile, only: [:index, :update]
    # To avoid adding user number as parameter like :id
    get 'profile/edit', to: 'profile#edit'

    ################
    # User project
    ########
    resources :projects
  end

  ################
  # Devise setting
  ########
  devise_for :users, only: [:sign_in, :sign_out, :session, :password]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  # Open Project
  resources :projects, only: [:index, :show]

  root 'projects#index'
end
