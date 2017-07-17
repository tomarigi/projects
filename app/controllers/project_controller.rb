class ProjectController < ApplicationController
  def index
    @projects = ActiveSupport::JSON.decode(File.read('projects.json'))
  end

  def show
    json = ActiveSupport::JSON.decode(File.read('projects.json'))
    @project = json[params[:id].to_i - 1]
  end
end
