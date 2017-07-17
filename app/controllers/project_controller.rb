class ProjectController < ApplicationController
  def index
    json = ActiveSupport::JSON.decode(File.read('projects.json'))
    @projects = json.sort { |x, y| Time.parse(x["updated"]) <=> Time.parse(y["updated"]) }.reverse
  end

  def show
    json = ActiveSupport::JSON.decode(File.read('projects.json'))
    @project = json[params[:id].to_i - 1]
  end
end
