class User < ApplicationRecord
  has_many :leads 
  has_many :contacts, through: :leads
end
