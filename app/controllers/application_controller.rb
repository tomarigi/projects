class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'user/application'
  def hello
    render html: "hello"
  end
end
