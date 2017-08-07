module Api 
  class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound,
    with: :respond_with_not_found
    
    private
    
    def render_error(status, resource = nil)
      render status: status,
      json: (resource ? { error: resource } : nil)
    end
    
    def respond_with_not_found(exception)
      render_error :not_found,
      {
        status: 404,
        name: "Not found",
        message: exception.message
      }
    end
  end
end
