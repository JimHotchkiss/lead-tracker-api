class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :phone_number, :email, :leads
  has_many :leads
  has_many :users, through: :leads
end
