class User::ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.where(:user_id => current_user).order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def show
  end

  def edit
    @project.main_image.cache! unless @project.main_image.blank?
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = 'Project was successfully created.'
      redirect_to user_project_path @project
    else
      # Error handling
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = 'Project was successfully updated.'
      redirect_to user_project_path @project
    else
      render :edit
    end
  end

  def destroy
    if @project.delete
      flash[:success] = 'Project was successfully deleted.'
    else
      render :edit
    end
    redirect_to user_projects_path
  end
  
  private

  def project_params
    params.require(:project).permit([
        :title,
        :main_image,
        :main_image_cache,
        :description,
        :is_published,
        :organization,
        :url,
        :established_at
    ])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
