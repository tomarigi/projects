class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'user/application'
  # saves the location before loading each page so we can return to the
  # right page. If we're on a devise page, we don't want to store that as the
  # place to return to (for example, we don't want to return to the sign in page
  # after signing in), which is what the :unless prevents
  before_action :store_current_location, :unless => :devise_controller?
  after_action :after_login

  # https://github.com/plataformatec/devise/wiki/How-To:-Redirect-back-to-current-page-after-sign-in,-sign-out,-sign-up,-update
  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_in_path_for(resource)
    # redirect user edit path if user visit first time, to change password.
    current_user.sign_in_count < 2 ? edit_user_profile_path(current_user) : root_path
  end

  def after_login

    # Check sign in
    if user_signed_in?
      # Check record exist
      if current_user.sign_in_count < 2 && current_user.profile.nil?
        current_user.profile = Profile.create(name: "トビタテ太郎")
      end
    end
  end

end
