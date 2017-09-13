class User::ProjectsController < ApplicationController
  def index
    @projects = Project.where(:user_id => current_user)
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = 'Project was successfully created.'
      redirect_to user_projects_path
    else
      # Error handling
      flash.now[:danger] = 'Project was not created.'
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = 'Project was successfully updated.'
      redirect_to user_projects_path
    else
      render 'edit'
    end
  end
  
  private

  def project_params
    params.require(:project).permit([
        :title,
        :main_image,
        :description
    ])
  end
end
