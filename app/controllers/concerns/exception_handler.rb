module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      render_error(500, :standard_error)
    end
    rescue_from CanCan::AccessDenied do |e|
      render_error(401, :access_denied)
    end
    rescue_from ActiveRecord::RecordNotFound do |e|
      render_error(404, :record_not_found)
    end
    rescue_from ActionController::InvalidAuthenticityToken do |e|
      render_error(400, :invalid_authenticity_token)
    end
    rescue_from ActionController::RoutingError do |e|
      render_error(404, :routing_error)
    end
  end

  private

  def render_error(status, key)
    render status: status, json: { success: false, errors: [I18n.t("errors.exception.#{key}")] }
  end
end