# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:stripe_connect]

  has_person_name

  has_many :projects, dependent: :destroy

  def can_receive_payments?
    uid? && provider? && access_code? && publishable_key?
  end
end
