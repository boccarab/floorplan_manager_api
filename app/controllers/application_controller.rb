class ApplicationController < ActionController::API
  include ExceptionHandlerConcern

  def route_not_found
    render json: { errors: ['Route not found'] }, status: :not_found, layout: false
  end
end
