module PasswordValidation
  extend ActiveSupport::Concern

  included do
    validate :password_complexity
  end

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,128}$/

    errors.add :password, I18n.t("errors.messages.password_complexity")
  end
end