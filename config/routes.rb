Rails.application.routes.draw do

  resources :project, only: [:index, :show]

  root 'project#index'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "omniauth_callbacks"
  }
end
