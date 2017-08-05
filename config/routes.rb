Rails.application.routes.draw do

  resources :project, only: [:index, :show]

  root 'project#index'
end
