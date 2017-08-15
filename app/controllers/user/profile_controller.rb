class User::ProfileController < ApplicationController
  before_action :authenticate_user!
  def index
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def edit
  end

  def update
  end
end
