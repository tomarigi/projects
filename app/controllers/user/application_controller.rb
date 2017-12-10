class User::ApplicationController < ApplicationController
  layout  'user/application'
  before_action :authenticate_user!
end