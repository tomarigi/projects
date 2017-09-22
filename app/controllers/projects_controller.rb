class ProjectsController < ApplicationController
  layout 'application'
  require "json"
  def index
    json = ActiveSupport::JSON.decode(File.read('projects.json'))
    @projects = json.sort { |x, y| Time.parse(x["updated"]) <=> Time.parse(y["updated"]) }.reverse

    @query = params[:q]
    unless @query.nil?
      @projects = search(@projects, @query)
    end

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


  def search(array, query)
    results = []

    # Search in json with query
    array.each do |obj|
      result = obj.select {|k, v| v.include?(query)}
      results.push(obj) unless result.empty?
    end

    results
  end

end
