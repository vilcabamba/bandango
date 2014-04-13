class HomeController < ApplicationController
  def index
  end

  def healthcheck
    head :no_content
  end
end
