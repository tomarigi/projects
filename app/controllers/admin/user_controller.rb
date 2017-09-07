class Admin::UserController < ApplicationController

  before_action :admin_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to admin_user_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
        :email, :password, :password_confirmation, :is_admin,
        profile_attributes: [:name, :term]
    )
  end

end
