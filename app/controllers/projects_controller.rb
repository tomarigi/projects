class ProjectsController < ApplicationController
  layout 'application'

  def index
    @query = Project.search(params[:q])
    @projects = @query.result.where(is_published: true).order('updated_at desc')
  end

  def show
    @project = Project.find(params[:id])

    # Redirect to root when it is not published
    unless @project.is_published
      flash[:warning] = '削除されたか、非公開の設定になっています。'
      redirect_to root_path
    end

    @profile = Profile.find_by(user_id: @project.user_id)
  end

end
