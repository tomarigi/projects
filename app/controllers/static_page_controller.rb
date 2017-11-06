class StaticPageController < ApplicationController
  def index
    @projects = Project.order('RANDOM()').limit(4)
  end
end
