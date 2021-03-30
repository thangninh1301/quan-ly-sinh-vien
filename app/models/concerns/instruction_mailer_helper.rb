module InstructionMailerHelper
  # def generate_confirmation_link token, options
  #   params = { confirmation_token: token, config: options['client-config'].to_s }
  #   "#{options['redirect-url']}?#{params.to_query}"
  # end

  def generate_reset_password_link token, options
    params = { reset_password_token: token, config: options['client-config'].to_s }
    "#{options['redirect-url']}?#{params.to_query}"
  end
end