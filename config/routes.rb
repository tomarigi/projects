Rails.application.routes.draw do
  get 'project/index'
  get 'project/show'

  root 'project#index'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "omniauth_callbacks"
  }
end
