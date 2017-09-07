Rails.application.routes.draw do

  namespace :admin do
    resources :user, only: [:new, :create]
  end

  namespace :user do
    resources :profile, only: [:index, :edit, :update]
  end

  devise_for :users, only: [:sign_in, :sign_out, :session, :password]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :project, only: [:index, :show]

  root 'project#index'
end
