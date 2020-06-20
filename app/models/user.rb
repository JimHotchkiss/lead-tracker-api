class User < ApplicationRecord
  has_secure_password
  has_many :leads
  has_many :contacts, through: :leads, dependent: :destroy
end
