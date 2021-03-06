class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email, :leads, :contacts
  has_many :leads 
  has_many :contacts, through: :leads
end
