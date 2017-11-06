class StaticPageController < ApplicationController
  def index
    @projects = Project.where(is_published: true).order('RANDOM()').limit(4)
  end
end
