class Administrator < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  include DeviseTokenAuth::Concerns::User
  include PasswordValidation
  include InstructionMailerHelper

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: Devise.email_regexp }

  before_validation :set_uid

  private

  def set_uid
    self.uid = self.email
  end
end
