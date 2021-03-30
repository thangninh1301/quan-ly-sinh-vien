class Api::V1::Admin::PasswordsController < DeviseTokenAuth::PasswordsController
  # https://devise-token-auth.gitbook.io/devise-token-auth/usage/reset_password
  # See abow page to understand password reset flow
  def edit
    # if a user is not found, return nil
    @resource = resource_class.with_reset_password_token(resource_params[:reset_password_token])

    if @resource && @resource.reset_password_period_valid?
      # ensure that user is confirmed
      @resource.skip_confirmation! if confirmable_enabled? && !@resource.confirmed_at
      # allow user to change password once without current_password
      @resource.allow_password_change = true if recoverable_enabled?

      @resource.save!

      yield @resource if block_given?

      render json: {
        success: true,
        data: {
          reset_password_token: resource_params[:reset_password_token]
        }
      }
    else
      render json: {
        success: false,
        errors: [I18n.t("errors.exception.token_invalid")]
      }
    end
  end

  def render_update_error_unauthorized
    render_error(401, [I18n.t("errors.exception.unauthorized")])
  end
end