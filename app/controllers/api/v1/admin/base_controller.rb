class Api::V1::Admin::BaseController < Api::V1::BaseController
  before_action :authenticate_api_v1_admin_administrator!

  def current_admin
    current_api_v1_admin_administrator
  end

  def current_ability
    @current_ability ||= ::AdminAbility.new(current_admin)
  end
end
