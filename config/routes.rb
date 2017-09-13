Rails.application.routes.draw do

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
    resources :projects, except: [:show]
  end

  devise_for :users, only: [:sign_in, :sign_out, :session, :password]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :project, only: [:index, :show]

  root 'project#index'
end
