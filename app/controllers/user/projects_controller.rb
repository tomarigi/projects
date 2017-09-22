class User::ProjectsController < ApplicationController
  def index
    @projects = Project.where(:user_id => current_user).order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(project_params)
    p "@project: #{@project.is_published}"
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

  def destroy
    @project = Project.find(params[:id])
    if @project.delete
      flash[:success] = 'Project was successfully deleted.'
    else
      flash.now[:danger] = 'Project was not deleted.'
    end
    redirect_to user_projects_path
  end
  
  private

  def project_params
    params.require(:project).permit([
        :title,
        :main_image,
        :description,
        :is_published
    ])
  end
end
