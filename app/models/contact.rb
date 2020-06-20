class Contact < ApplicationRecord
  has_many :leads
  has_many :users, through: :leads, dependent: :destroy
end
