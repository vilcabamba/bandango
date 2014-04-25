class ApiController < ApplicationController
  include ControllerTrackable

  respond_to :json
end
