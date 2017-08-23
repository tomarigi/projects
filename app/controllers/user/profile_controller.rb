class User::ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :edit, :update]

  def index
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        @profile.save
        format.html { redirect_to user_profile_index_path, notice: 'Profile was successfully updated.' }
        format.json { render :index, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def set_user
      @profile = Profile.find_by(user_id: current_user.id)
    end


    def profile_params
      params.require(:profile).permit([:name, :term])
    end


end
