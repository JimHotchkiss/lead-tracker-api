class User < ApplicationRecord
  has_many :leads 
  has_many :contact, through: :leads
end
