Rails.application.routes.draw do
  get 'project/index'

  get 'project/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'project#index'
end
