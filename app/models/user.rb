class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :omniauthable, :trackable, :omniauth_providers => [:google_oauth2]
end
