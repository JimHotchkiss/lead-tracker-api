class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :phone_number, :email, :leads
end
