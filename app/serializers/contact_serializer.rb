class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :phone_number, :email
  has_many :leads
  has_many :users, through: :leads
end
