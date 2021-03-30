class Api::V1::Admin::AdministratorsController < Api::V1::Admin::BaseController
  load_and_authorize_resource only: [:update, :me]

  def me
    render json: {
      success: true,
      data: AdministratorSerializer.new(current_admin).as_json
    }
  end

  def update
    current_admin.assign_attributes(administrator_params)

    if current_admin.save
      render json: {
        success: true,
        data: AdministratorSerializer.new(current_admin).as_json
      }
    else
      render json: {
        success: false,
        errors: current_admin.errors
      }
    end
  end

  private

  def administrator_params
    params.require(:administrator).permit(:email, :name, :password, :password_confirmation)
  end
end
