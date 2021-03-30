class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PasswordValidation
  include InstructionMailerHelper

  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: Devise.email_regexp }
  validates :name, presence: true, length: { maximum: 255 }
end
