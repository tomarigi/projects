class ProjectController < ApplicationController
  require "json"
  def index
    json = ActiveSupport::JSON.decode(File.read('projects.json'))
    @projects = json.sort { |x, y| Time.parse(x["updated"]) <=> Time.parse(y["updated"]) }.reverse

    query = params[:q]
    if query != ""
      results = []

      # Search in json with query
      @projects.each do |obj|
        result = obj.select {|k, v| v.include?(query)}
        results.push(obj) unless result.empty?
      end

      @projects = results
    end

  end

  def show
    json = ActiveSupport::JSON.decode(File.read('projects.json'))
    @project = json[params[:id].to_i - 1]
  end
end
